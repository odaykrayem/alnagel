// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/data/repoistory/transporter_carrier_repo.dart';
import 'package:alnagel/models/carrier_model.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterCarrierController extends GetxController {
  final TransporterCarrierRepo transporterCarrierRepo;
  List<CarrierModel> _carriers = [];
  List<CarrierModel> get carriersList => _carriers;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  TransporterCarrierController({
    required this.transporterCarrierRepo,
  });

  Future<void> addCarrier(Map<String, dynamic> info) async {
    // _carriers.clear();
    Response response = await transporterCarrierRepo.addCarrier(info);
    debugPrint('tran carrier responce : ${response.bodyString}');
    debugPrint('tran carrier stCode: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran carrier controller : carrier added');
      CarrierModel carrierModel = CarrierModel.fromJson(response.body);
      _carriers.add(CarrierModel.fromJson(response.body));
      debugPrint('${carrierModel.toJson()}');
      showToast(text: 'carrier added successfully');
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran carrier controller : could not add carrier');
    }
  }

  Future<void> getCarriers(Map<String, dynamic> info) async {
    Response response = await transporterCarrierRepo.getMyCarriers(info);

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran carriers controller : carriers laoded');
      debugPrint('tran carriers controller : ${response.body}');

      _carriers = []; //initialze to not repeat data
      List<dynamic> map = response.body;
      _carriers = map.map((elemnt) => CarrierModel.fromJson(elemnt)).toList();
      _carriers.forEach((element) {
        debugPrint(element.toString());
      });

      // _services.add(ServiceModel.fromJson(response.body));
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran carriers controller : could not get carriers');
    }
  }
}
