// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/data/repoistory/user_banners_repo.dart';
import 'package:alnagel/models/banner_model.dart';
import 'package:alnagel/models/service_model.dart';
import 'package:alnagel/utils/showToast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBannerController extends GetxController {
  final UserBannersRepo userBannersRepo;
  List<BannerModel> _banners = [];
  List<BannerModel> get bannersList => _banners;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  UserBannerController({
    required this.userBannersRepo,
  });

  Future<void> getBanners(Map<String, dynamic> info) async {
    Response response = await userBannersRepo.getBanners();

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran banners controller : banners laoded');
      debugPrint('tran banners controller : ${response.body}');

      _banners = []; //initialze to not repeat data
      List<dynamic> map = response.body;
      _banners = map.map((elemnt) => BannerModel.fromJson(elemnt)).toList();
      _banners.forEach((element) {
        debugPrint(element.toString());
      });
      showToast(text: 'banners loaded');
      // _banners.add(ServiceModel.fromJson(response.body));
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran banners controller : could not get banners');
    }
  }
}
