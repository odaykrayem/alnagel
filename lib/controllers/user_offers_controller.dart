// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/data/repoistory/user_offers_repo.dart';
import 'package:alnagel/models/user_offer_model.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOffersController extends GetxController {
  final UserOffersRepo userOffersRepo;
  List<UserOfferModel> _offers = [];
  List<UserOfferModel> get offersList => _offers;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  UserOffersController({
    required this.userOffersRepo,
  });

  Future<void> getOrderOffers(Map<String, dynamic> info) async {
    _isLoaded = false;
    Response response = await userOffersRepo.getOrderOffers(info);

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('user offers controller : offers laoded');
      debugPrint('user offers controller : ${response.body}');

      _offers = []; //initialze to not repeat data
      List<dynamic> map = response.body['offers'];
      _offers = map.map((elemnt) => UserOfferModel.fromJson(elemnt)).toList();
      _offers.forEach((element) {
        debugPrint(element.toString());
      });

      // _offers.add(UserOfferModel.fromJson(response.body));
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('user offers controller : could not get offers');
    }
  }

  Future<void> acceptOffer(Map<String, dynamic> info) async {
    _isLoaded = false;
    update();
    Response response = await userOffersRepo.acceptOffer(info);
    debugPrint(' responce : ${response.bodyString}');
    debugPrint('stCode: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('user offers controller : offer accepted');

      _isLoaded = true;
      showToast(text: 'offer accepted');
      update(); //it works like setState to update ui
    } else {
      debugPrint('user offers controller : could not accept offer');
    }
  }

  Future<void> cancelOffer(Map<String, dynamic> info) async {
    _isLoaded = false;
    update();
    Response response = await userOffersRepo.cancelOffer(info);
    debugPrint(' responce : ${response.bodyString}');
    debugPrint('stCode: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('user offers controller : offer canceled');

      _isLoaded = true;
      showToast(text: 'offer canceled');
      update(); //it works like setState to update ui
    } else {
      debugPrint('user offers controller : could not cancel offer');
    }
  }

  Future<void> updateOrder(Map<String, dynamic> info) async {
    _isLoaded = false;
    update();
    Response response = await userOffersRepo.updateOrder(info);
    debugPrint(' responce : ${response.bodyString}');
    debugPrint('stCode: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('user offers controller : order updated');

      _isLoaded = true;
      showToast(text: 'order updated');
      update(); //it works like setState to update ui
    } else {
      _isLoaded = true;
      update();
      debugPrint('user offers controller : could not updat order');
    }
  }
}
