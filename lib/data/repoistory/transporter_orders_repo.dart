// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:alnagel/data/api/api_client.dart';

class TransporterOrdersRepo extends GetxService {
  final ApiClient apiClient;

  TransporterOrdersRepo({
    required this.apiClient,
  });

  Future<Response> getWaitOrdersList(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.WAIT_ORDER, info);
  }

  Future<Response> getAllOrdersList(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.ALL_ORDERS, info);
  }
}
