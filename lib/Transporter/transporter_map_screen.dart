import 'dart:async';

import 'package:alnagel/controllers/app_controller.dart';
import 'package:alnagel/models/marker_model.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:alnagel/utils/location_service.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart' as loc;

class TransporterMapScreen extends StatefulWidget {
  const TransporterMapScreen({Key? key}) : super(key: key);

  @override
  State<TransporterMapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<TransporterMapScreen> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  String userID = '${Get.find<AppController>().getUserInfo()!.id}';

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(24.774265, 46.738586),
    zoom: 13.0,
  );

  late GoogleMapController _googleMapController;
  late BitmapDescriptor userMarkerIcon, captinMarkerIcon;

  Set<Marker> markers = <Marker>{};
  Set<Polyline> polylines = <Polyline>{};
  // Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  late geo.Position _userLocation, _captinLocation;
  String? userloc, captinloc;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userMarkerIcon = MarkerModel.markers[CategoryType.userMarker]!;
    captinMarkerIcon = MarkerModel.markers[CategoryType.captinMarker]!;

    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: markers,
          polylines: polylines,
          // onLongPress: (pos) {
          //   _captinLocation = geo.Position(
          //       // longitude: pos.longitude,
          //       // latitude: pos.latitude,
          //       latitude: 24.68048389114559,
          //       longitude: 46.63596021256566,
          //       timestamp: DateTime.now(),
          //       accuracy: 0.5,
          //       altitude: pos.latitude,
          //       heading: 1,
          //       speed: 1,
          //       speedAccuracy: 1);

          //   setState(() {
          //     polylines.clear();
          //     addNewPolyLine();
          //     _addMarker(
          //         id: 'captin',
          //         location: _captinLocation,
          //         icon: captinMarkerIcon,
          //         updateCam: true);
          //   });
          // },
        ),
        Positioned(bottom: 12, right: 8, left: 8, child: infoCard()),
      ],
    );
  }

  void addNewPolyLine() async {
    var directions = await LocationService().getDirectionsByCoordintesTomtom(
        LatLng(_userLocation.latitude, _userLocation.longitude),
        LatLng(_captinLocation.latitude, _captinLocation.longitude));
    List<dynamic> points1 = directions['polyline'];
    debugPrint(points1.toString());
    List<PointLatLng> points2 =
        points1.map((e) => PointLatLng(e['latitude'], e['longitude'])).toList();
    showToast(text: points2[0].toString());
    points2.map((e) => debugPrint('${e.latitude} " " ${e.longitude} '));
    points2.insert(
        0, PointLatLng(_userLocation.latitude, _userLocation.longitude));
    points2
        .add(PointLatLng(_captinLocation.latitude, _captinLocation.longitude));
    _createPolyLine('new', points2);
  }

  Future checkPermission() async {
    //we will check for location permission if it is enabled
    //then we check for gps if it is enabledd and we are using
    // location package to enable gps if it is not

    geo.LocationPermission per = await geo.Geolocator.checkPermission();

    if (per == geo.LocationPermission.denied) {
      per = await geo.Geolocator.requestPermission();
      //if user deny permission after asking for it
      if (per == geo.LocationPermission.denied) {
        showToast(text: 'location permission denied');
      } else {
        checkGPSService();
      }
    } else {
      showToast(text: 'permission ok');
      checkGPSService();
    }
  }

  void checkGPSService() async {
    loc.Location location = loc.Location();

    bool isLocationServiceEnabled = await location.serviceEnabled();

    if (isLocationServiceEnabled) {
      showToast(text: 'service ok');

      // updateMapWithCurrentUserLocation();
    } else {
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        // updateMapWithCurrentUserLocation();
      } else {
        showToast(text: 'please enable GPS');
      }
    }
  }

  void updateMapWithCurrentUserLocation() async {
    _userLocation = await _getUserCurrentLocation();

    // _userLocation = geo.Position(
    //     // longitude: pos.longitude,
    //     // latitude: pos.latitude,
    //     latitude: 25.708492067296234,
    //     longitude: 45.87239475540635,
    //     timestamp: DateTime.now(),
    //     accuracy: 0.5,
    //     altitude: 25.708492067296234,
    //     heading: 1,
    //     speed: 1,
    //     speedAccuracy: 1);
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(_userLocation.latitude, _userLocation.longitude),
          zoom: 14.47)),
    );

    setState(() {
      _addMarker(
          id: 'user',
          location: _userLocation,
          icon: userMarkerIcon,
          updateCam: false);
    });
  }

  _getLocation() async {
    try {
      loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc(userID).set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude
        // 'latitude': _locationResult.latitude,
        // 'longitude': _locationResult.longitude
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      debugPrint(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentLocation) async {
      await FirebaseFirestore.instance.collection('location').doc(userID).set({
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude
      }, SetOptions(merge: true));
    });
  }

  _stopListenLocation() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  Future<geo.Position> _getUserCurrentLocation() async {
    geo.Position? userLocation;
    userLocation = await geo.Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: true);

    userLocation ??= await geo.Geolocator.getCurrentPosition(
      desiredAccuracy: geo.LocationAccuracy.bestForNavigation,
      forceAndroidLocationManager: true,
    );
    return userLocation;
  }

  void _addMarker(
      {required String id,
      required geo.Position location,
      required BitmapDescriptor icon,
      required bool updateCam}) {
    setState(() {
      Marker marker = Marker(
        markerId: MarkerId(id),
        position: LatLng(location.latitude, location.longitude),
        icon: icon,
      );
      markers.add(marker);
      if (updateCam) {
        _googleMapController.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(location.latitude, location.longitude),
                zoom: 11.0)));
      }
    });
  }

  _createPolyLine(String idValue, List<PointLatLng> points) {
    PolylineId id = PolylineId(idValue);
    Polyline polyline = Polyline(
      width: 2,
      polylineId: id,
      color: Colors.teal,
      points: points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList(),
      patterns: [
        PatternItem.dash(3),
        PatternItem.gap(3),
      ],
    );
    polylines.add(polyline);
    setState(() {});
  }

  Widget infoCard() {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 12),
            child: Divider(
              color: Colors.grey[600],
              thickness: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'المسافة'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    '12' + ' km',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.grey.shade400),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _listenLocation();
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'بدء التتبع'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _stopListenLocation();
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'ايقاف التتبع'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
