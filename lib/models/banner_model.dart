// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/utils/app_constants.dart';

class BannerModel {
  final int id;
  final String banner;
  final String state;

  BannerModel({
    required this.id,
    required this.banner,
    required this.state,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      banner: AppConstants.IMAGE_URL + json['banner'],
      state: json['state'] is String ? json['state'] : '${json['state']}',
    );
  }
}
