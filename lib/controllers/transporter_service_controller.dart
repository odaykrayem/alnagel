// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/models/service_model.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alnagel/data/repoistory/tranporter_services_repo.dart';

class TransporterServiceController extends GetxController {
  final TransporterServicesRepo transporterServicesRepo;
  List<ServiceModel> _services = [];
  List<ServiceModel> get servicesList => _services;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  TransporterServiceController({
    required this.transporterServicesRepo,
  });

  Future<void> addService(Map<String, dynamic> info) async {
    Response response = await transporterServicesRepo.addService(info);
    debugPrint(' responce : ${response.bodyString}');
    debugPrint('stCode: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran service controller : service added');
      ServiceModel serviceModel = ServiceModel.fromJson(response.body);
      _services.add(ServiceModel.fromJson(response.body));
      debugPrint('${serviceModel.toJson()}');
      showToast(text: 'service added successfully');
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran service controller : could not add service');
    }
  }

  Future<void> getServices(Map<String, dynamic> info) async {
    Response response = await transporterServicesRepo.getServices(info);

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran services controller : services laoded');
      debugPrint('tran services controller : ${response.body}');

      _services = []; //initialze to not repeat data
      List<dynamic> map = response.body;
      _services = map.map((elemnt) => ServiceModel.fromJson(elemnt)).toList();
      _services.forEach((element) {
        debugPrint(element.toString());
      });

      // _services.add(ServiceModel.fromJson(response.body));
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran services controller : could not get services');
    }
  }
}
