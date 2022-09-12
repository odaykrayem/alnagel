import 'dart:convert' as convert;
import 'dart:convert';

import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const String tomtomKey = 'MxbcUrAj4UVbCNnSnIExBgMVTf4FdjmZ';
const String googleMapKey = 'AIzaSyDY2ORT802A2ab8PRs8Pj_NG323NlxXtFo';

class LocationService {
  // Future<String> getPlaceId(String input) async {
  //   final String url =
  //       "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$googleMapKey";
  //   var response = await http.get(Uri.parse(url));
  //   var json = convert.jsonDecode(response.body);
  //   var placeId = json['candidates'][0]['place_id'] as String;
  //   return placeId;
  // }

  // Future<Map<String, dynamic>> getPlace(String input) async {
  //   final placeId = await getPlaceId(input);
  //   final String url =
  //       "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleMapKey";
  //   var response = await http.get(Uri.parse(url));
  //   var json = convert.jsonDecode(response.body);
  //   var results = json['result'] as Map<String, dynamic>;
  //   return results;
  // }

  Future<Map<String, dynamic>> getDirectionsByLocationName(
      String origin, String destination) async {
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$googleMapKey";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    showToast(text: json.toString());
    var results = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs']['start_location'],
      'end_location': json['routes'][0]['legs']['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decode': PolylinePoints()
          .decodePolyline(json['routes'][0]['overview_polyline']['points'])
    };
    return results;
  }

//Ge directions by googleMap
  Future<Map<String, dynamic>> getDirectionsByCoordintes(
      Position origin, Position destination) async {
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleMapKey";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    showToast(text: json.toString());
    var results = {
      // 'bounds_ne': json['routes'][0]['bounds']['northeast'],
      // 'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs']['start_location'],
      'end_location': json['routes'][0]['legs']['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decode': PolylinePoints()
          .decodePolyline(json['routes'][0]['overview_polyline']['points'])
    };
    print(results);
    return results;
  }
//TOMTOM

  Future<Map<String, dynamic>> getDirectionsByCoordintesTomtom(
      LatLng origin, LatLng destination) async {
    debugPrint('origin ${origin.latitude}');
    debugPrint('dest ${destination.latitude}');
    final String url =
        "https://api.tomtom.com/routing/1/calculateRoute/${origin.latitude}%2C${origin.longitude}%3A${destination.latitude}%2C${destination.longitude}/json?key=$tomtomKey";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> none = {};
    if (response.body.contains('Developer Over Qps')) {
      return none;
    }
    var json = convert.jsonDecode(response.body);
    showToast(text: 'info got');
    debugPrint('response' + json.toString());
    // showToast(text: json.toString());
    var results = {
      // 'bounds_ne': json['routes'][0]['bounds']['northeast'],
      // 'bounds_sw': json['routes'][0]['bounds']['southwest'],
      // 'start_location': json['routes'][0]['legs']['start_location'],
      // 'end_location': json['routes'][0]['legs']['end_location'],
      'polyline': json['routes'][0]['legs'][0]['points'],
    };
    // debugPrint(results.toString());
    return results;
  }

  Future<Map<String, dynamic>> getLocationNameByCoordinates(
      LatLng location) async {
    final String url =
        "https://api.tomtom.com/search/2/reverseGeocode/${location.latitude}%2C${location.longitude}.json?returnSpeedLimit=false&radius=10000&returnRoadUse=false&allowFreeformNewLine=false&returnMatchType=false&view=Unified&key=$tomtomKey";

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(utf8.decode(response.bodyBytes));
    // showToast(text: json.toString());
    var results = {
      'street': json['addresses'][0]['address']['street'],
      'streetName': json['addresses'][0]['address']['streetName'],
      'streetNameAndNumber': json['addresses'][0]['address']
          ['streetNameAndNumber'],
      'countryCode': json['addresses'][0]['address']['countryCode'],
      'countrySubdivision': json['addresses'][0]['address']
          ['countrySubdivision'],
      'countrySecondarySubdivision': json['addresses'][0]['address']
          ['countrySecondarySubdivision'],
      'municipality': json['addresses'][0]['address']['municipality'],
      'postalCode': json['addresses'][0]['address']['postalCode'],
      'municipalitySubdivision': json['addresses'][0]['address']
          ['municipalitySubdivision'],
      'country': json['addresses'][0]['address']['country'],
      'countryCodeISO3': json['addresses'][0]['address']['countryCodeISO3'],
      'freeformAddress': json['addresses'][0]['address']['freeformAddress'],
    };
    // debugPrint('street  :' + results['freeformAddress'].toString());
    return results;
  }
}
