// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:alnagel/data/api/api_client.dart';

class TransporterRateRepo extends GetxService {
  final ApiClient apiClient;

  TransporterRateRepo({
    required this.apiClient,
  });

  Future<Response> getMyReviews(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.MY_RATE, info);
  }

  // Future<Response> getAllOrdersList(Map<String, dynamic> info) async {
  //   return await apiClient.postData(AppConstants.ALL_ORDERS, info);
  // }
}
