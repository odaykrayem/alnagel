import 'package:alnagel/data/api/api_client.dart';
import 'package:alnagel/utils/app_constants.dart';
import 'package:get/get.dart';

class TransporterServicesRepo {
  final ApiClient apiClient;

  TransporterServicesRepo({
    required this.apiClient,
  });

  Future<Response> addService(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.ADD_SERVICE, info);
  }

  Future<Response> getServices(Map<String, dynamic> info) async {
    return await apiClient.postData(AppConstants.MY_SERVICE, info);
  }
}
