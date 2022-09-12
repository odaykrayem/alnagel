// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:alnagel/models/marker_model.dart';
import 'package:alnagel/utils/location_service.dart';
import 'package:alnagel/utils/showToast.dart';

class UserMapScreen extends StatefulWidget {
  final String userId;
  const UserMapScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserMapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<UserMapScreen> {
  late GoogleMapController _googleMapController;
  late BitmapDescriptor userMarkerIcon, captinMarkerIcon;
  bool _added = false;
  bool _userLocationGot = false;

  int tomtomQPS = 0;
  late Timer _requestTimer;

  final loc.Location location = loc.Location();

  Set<Marker> markers = <Marker>{};
  Set<Polyline> polylines = <Polyline>{};
  Map<PolylineId, Polyline> polylinesMap = {};

  // Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  // late geo.Position _userLocation, _captinLocation;
  // late loc.LocationData _userLocation2;
  LatLng _userLocation2 = LatLng(24.588286192847818, 46.70493214585366);

  // String? userloc, captinloc;

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    _requestTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userMarkerIcon = MarkerModel.markers[CategoryType.userMarker]!;
    captinMarkerIcon = MarkerModel.markers[CategoryType.captinMarker]!;

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('location').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (_added) {
            mymap(snapshot);
          }
          // if (snapshot.hasData && _userLocationGot) {

          // }
          if (!snapshot.hasData || !_userLocationGot) {
            return const Center(child: CircularProgressIndicator());
          }
          // markers.add(
          //   Marker(
          //     markerId: const MarkerId('mark1'),
          //     icon: captinMarkerIcon,
          //     position: LatLng(
          //       snapshot.data!.docs.singleWhere(
          //           (element) => element.id == widget.userId)['latitude'],
          //       snapshot.data!.docs.singleWhere(
          //           (element) => element.id == widget.userId)['longitude'],
          //     ),
          //   ),
          // );
          return Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.userId)['latitude'],
                    snapshot.data!.docs.singleWhere(
                        (element) => element.id == widget.userId)['longitude'],
                  ),
                ),
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    _googleMapController = controller;
                    _added = true;
                    addNewPolyLine(
                      LatLng(
                          _userLocation2.latitude!, _userLocation2.longitude!),
                      LatLng(
                        snapshot.data!.docs.singleWhere((element) =>
                            element.id == widget.userId)['latitude'],
                        snapshot.data!.docs.singleWhere((element) =>
                            element.id == widget.userId)['longitude'],
                      ),
                    );
                  });
                },
                markers: {
                  Marker(
                    markerId: const MarkerId('mark1'),
                    icon: captinMarkerIcon,
                    position: LatLng(
                      snapshot.data!.docs.singleWhere(
                          (element) => element.id == widget.userId)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.userId)['longitude'],
                    ),
                  ),
                  Marker(
                    markerId: MarkerId('id'),
                    position: LatLng(
                        _userLocation2.latitude!, _userLocation2.longitude!),
                    icon: userMarkerIcon,
                  ),
                },
                // polylines: polylines,
                polylines: Set<Polyline>.of(polylinesMap.values),
              ),
              Positioned(bottom: 12, right: 8, left: 8, child: infoCard()),
            ],
          );
        });
  }

  Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.userId)['latitude'],
              snapshot.data!.docs.singleWhere(
                  (element) => element.id == widget.userId)['longitude'],
            ),
            zoom: 14.47)));
    debugPrint('step 1');
    addNewPolyLine(
      LatLng(_userLocation2.latitude!, _userLocation2.longitude!),
      LatLng(
        snapshot.data!.docs
            .singleWhere((element) => element.id == widget.userId)['latitude'],
        snapshot.data!.docs
            .singleWhere((element) => element.id == widget.userId)['longitude'],
      ),
    );
  }

  void addNewPolyLine(LatLng myLocation, LatLng captinLocation) async {
    debugPrint('${captinLocation.latitude} : ${captinLocation.longitude}');
    debugPrint('step 2');

    // polylines.clear();
    if (tomtomQPS < 6) {
      _requestTimer = Timer(Duration(seconds: 10), () async {
        var directions = await LocationService()
            .getDirectionsByCoordintesTomtom(myLocation, captinLocation);

        tomtomQPS++;
        if (directions.isNotEmpty) {
          List<dynamic> points1 = directions['polyline'];

          debugPrint('points1' + points1.toString());
          List<PointLatLng> points2 = points1
              .map((e) => PointLatLng(e['latitude'], e['longitude']))
              .toList();
          showToast(text: points2[0].toString());
          debugPrint('points');
          points2.map(
              (e) => debugPrint('points :${e.latitude} " " ${e.longitude} '));
          points2.insert(
              0, PointLatLng(myLocation.latitude, myLocation.longitude));
          points2.add(
              PointLatLng(captinLocation.latitude, captinLocation.longitude));
          _createPolyLine('new', points2);
        }
      });
    } else {
      showToast(text: 'Api limits accessed');
      Future.delayed(Duration(seconds: 40), () {
        tomtomQPS = 0;
      });
      return;
    }
  }

  _createPolyLine(String idValue, List<PointLatLng> points) {
    // polylines.clear();
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
    polylinesMap[PolylineId(idValue)] = polyline;
    // polylines.add(polyline);

    setState(() {});
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
      // _userLocation = await _getUserCurrentLocation();
      updateMapWithCurrentUserLocation();
    } else {
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        // _userLocation = await _getUserCurrentLocation();
        updateMapWithCurrentUserLocation();
      } else {
        showToast(text: 'please enable GPS');
      }
    }
  }

  Future<loc.LocationData> _getUserCurrentLocation2() async {
    loc.LocationData _locationResult = await location.getLocation();
    return _locationResult;
  }

  void updateMapWithCurrentUserLocation() async {
    // _userLocation2 = await _getUserCurrentLocation2();
    //TODO
    // _userLocation = geo.Position(
    //     // longitude: pos.longitude,
    //     // latitude: pos.latitude,
    //     latitude: _userLocation2.latitude!,
    //     longitude: _userLocation2.longitude!,
    //     timestamp: DateTime.now(),
    //     accuracy: 0.5,
    //     altitude: _userLocation2,
    //     heading: 1,
    //     speed: 1,
    //     speedAccuracy: 1);

    setState(() {
      _userLocationGot = true;

      // _addMarker(
      //     id: 'user',
      //     lat: _userLocation2.latitude!,
      //     lon: _userLocation2.longitude!,
      //     icon: userMarkerIcon,
      //     updateCam: false);
    });
  }

  // Future<geo.Position> _getUserCurrentLocation() async {
  //   geo.Position? userLocation;
  //   userLocation = await geo.Geolocator.getLastKnownPosition(
  //       forceAndroidLocationManager: true);

  //   userLocation ??= await geo.Geolocator.getCurrentPosition(
  //     desiredAccuracy: geo.LocationAccuracy.bestForNavigation,
  //     forceAndroidLocationManager: true,
  //   );
  //   return userLocation;
  // }

  void _addMarker(
      {required String id,
      required double lat,
      required double lon,
      required BitmapDescriptor icon,
      required bool updateCam}) {
    Marker marker = Marker(
      markerId: MarkerId(id),
      position: LatLng(lat, lon),
      icon: icon,
    );
    markers.add(marker);
    if (updateCam) {
      _googleMapController.moveCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lon), zoom: 14.47)));
    }
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
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      updateMapWithCurrentUserLocation();
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
                      ' ايجاد موقعي'.tr,
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
