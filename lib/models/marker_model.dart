import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

enum CategoryType { userMarker, captinMarker }

class MarkerModel {
  static Map<CategoryType, BitmapDescriptor> markers =
      <CategoryType, BitmapDescriptor>{};

  void init(BuildContext context) async {
    loadBitmapDescriptors(context);
  }

  Future<void> loadBitmapDescriptors(context) async {
    markers[CategoryType.userMarker] = await _bitmapDescriptorFromSvgAsset(
        context, 'assets/icons/map_marker_point.svg');
    markers[CategoryType.captinMarker] = await _bitmapDescriptorFromSvgAsset(
        context, 'assets/icons/map_marker_32.svg');
  }

  Future<BitmapDescriptor> _bitmapDescriptorFromSvgAsset(
      BuildContext context, String assetName) async {
    String svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);
    //Draws string representation of svg to DrawableRoot
    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, 'key');
    ui.Picture picture = svgDrawableRoot.toPicture();
    ui.Image image = await picture.toImage(37, 37);
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }
}
