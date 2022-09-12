import 'package:alnagel/data/api/api_client.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';

class TransporterOffersRepo {
  final ApiClient apiClient;

  TransporterOffersRepo({
    required this.apiClient,
  });

  Future<Response> addOffer(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.ADD_OFFER, info);
  }

  Future<Response> getMyOffers(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.MY_OFFERS, info);
  }
}
