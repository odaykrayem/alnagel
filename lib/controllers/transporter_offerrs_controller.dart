// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/data/repoistory/transporter_carrier_repo.dart';
import 'package:alnagel/data/repoistory/transporter_offers_repo.dart';
import 'package:alnagel/models/carrier_model.dart';
import 'package:alnagel/models/offer_model.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterOffersController extends GetxController {
  final TransporterOffersRepo transporterOffersRepo;
  List<OfferModel> _offers = [];
  List<OfferModel> get offersList => _offers;
  bool _isLoaded = false;
  bool _isOfferAdded = false;

  bool get isLoaded => _isLoaded;
  bool get isOfferAdded => _isOfferAdded;

  TransporterOffersController({
    required this.transporterOffersRepo,
  });

  Future<void> addOffer(Map<String, dynamic> info) async {
    _isOfferAdded = false;
    Response response = await transporterOffersRepo.addOffer(info);
    debugPrint('tran offer responce : ${response.bodyString}');
    debugPrint('tran offer stCode: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran offers controller : offer added');
      OfferModel offerModel = OfferModel.fromJson(response.body);
      _offers.add(OfferModel.fromJson(response.body));

      debugPrint('${offerModel.toJson()}');
      showToast(text: 'offer added successfully');
      Get.defaultDialog(
          barrierDismissible: true,
          radius: 10,
          contentPadding: EdgeInsets.zero,
          content: Container(
            // height: height - 400,
            // width: width - 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: Image.asset(
                  'assets/icons/Group 8775.png',
                )),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'تم إرسال العرض بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ));
      _isOfferAdded = true;

      update(); //it works like setState to update ui
    } else {
      debugPrint('tran offers controller : could not add caofferrrier');
    }
  }

  Future<void> getOffers(Map<String, dynamic> info) async {
    Response response = await transporterOffersRepo.getMyOffers(info);
    debugPrint('${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran offers controller : offers laoded');
      debugPrint('tran offers controller : ${response.body}');

      _offers = []; //initialze to not repeat data
      List<dynamic> map = response.body;
      _offers = map.map((elemnt) => OfferModel.fromJson(elemnt)).toList();
      _offers.forEach((element) {
        debugPrint(element.toString());
      });

      // _services.add(ServiceModel.fromJson(response.body));
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran offers controller : could not get offers');
    }
  }
}
