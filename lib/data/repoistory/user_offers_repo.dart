// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:alnagel/data/api/api_client.dart';

class UserOffersRepo extends GetxService {
  final ApiClient apiClient;

  UserOffersRepo({
    required this.apiClient,
  });

  Future<Response> getOrderOffers(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.GET_ORDER_OFFERS, info);
  }

  Future<Response> updateOrder(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.UPDATE_ORDER, info);
  }

  Future<Response> acceptOffer(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.ACCEPT_OFFER, info);
  }

  Future<Response> cancelOffer(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.CANCEL_OFFER, info);
  }
}
