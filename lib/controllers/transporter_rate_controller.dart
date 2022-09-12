// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/data/repoistory/transporter_rate_repo.dart';
import 'package:alnagel/models/rate_model.dart';
import 'package:alnagel/models/service_model.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterRateController extends GetxController {
  final TransporterRateRepo transporterRateRepo;
  List<RateModel> _reviews = [];
  List<RateModel> get reviewsList => _reviews;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  TransporterRateController({
    required this.transporterRateRepo,
  });

  // Future<void> addService(Map<String, dynamic> info) async {
  //   Response response = await transporterServicesRepo.addService(info);
  //   debugPrint(' responce : ${response.bodyString}');
  //   debugPrint('stCode: ${response.statusCode}');
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     debugPrint('tran service controller : service added');
  //     RateModel serviceModel = RateModel.fromJson(response.body);
  //     _reviews.add(RateModel.fromJson(response.body));
  //     debugPrint('${serviceModel.toJson()}');
  //     showToast(text: 'service added successfully');
  //     update(); //it works like setState to update ui
  //   } else {
  //     debugPrint('tran service controller : could not add service');
  //   }
  // }

  Future<void> getReviews(Map<String, dynamic> info) async {
    Response response = await transporterRateRepo.getMyReviews(info);

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran reviews controller : reviews laoded');
      debugPrint('tran reviews controller : ${response.body}');

      _reviews = []; //initialze to not repeat data
      List<dynamic> map = response.body;
      _reviews = map.map((elemnt) => RateModel.fromJson(elemnt)).toList();
      _reviews.forEach((element) {
        debugPrint(element.toString());
      });

      // _reviews.add(RateModel.fromJson(response.body));
      _isLoaded = true;
      if (_reviews.isNotEmpty) {
        showToast(text: 'Reviews loaded');
      } else {
        showToast(text: ' No Reviews yet');
      }
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran reviews controller : could not get reviews');
    }
  }
}
