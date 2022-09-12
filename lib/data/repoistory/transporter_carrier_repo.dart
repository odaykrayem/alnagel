import 'package:alnagel/data/api/api_client.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';

class TransporterCarrierRepo {
  final ApiClient apiClient;

  TransporterCarrierRepo({
    required this.apiClient,
  });

  Future<Response> addCarrier(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.ADD_TRUCK, info);
  }

  Future<Response> getMyCarriers(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.MY_TRUCK, info);
  }
}
