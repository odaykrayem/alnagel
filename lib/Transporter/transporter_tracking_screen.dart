// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/Transporter/transporter_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransporterTrackingScreen extends StatefulWidget {
  const TransporterTrackingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TransporterTrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TransporterTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          centerTitle: false,
          title: Text(
            'رجوع'.tr,
            style: const TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: Colors.black,
              )),
        ),
        body: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.white,
              ),
            ),
            child: const TransporterMapScreen()),
      ),
    );
  }
}
