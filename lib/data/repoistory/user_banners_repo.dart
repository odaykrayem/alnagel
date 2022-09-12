import 'package:alnagel/data/api/api_client.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';

class UserBannersRepo {
  final ApiClient apiClient;

  UserBannersRepo({
    required this.apiClient,
  });

  Future<Response> getBanners() async {
    return await apiClient.getData(AppConstants.GET_BANNERS);
  }
}
