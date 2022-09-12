import 'package:alnagel/data/repoistory/transporter_orders_repo.dart';
import 'package:alnagel/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransporterOrdersController extends GetxController {
  final TransporterOrdersRepo transporterOrdersRepo;
  List<OrderModel> _orders = [];
  List<OrderModel> get ordersList => _orders;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  TransporterOrdersController({
    required this.transporterOrdersRepo,
  });

  Future<void> getWaitOrders(Map<String, dynamic> info) async {
    _isLoaded = false;
    Response response = await transporterOrdersRepo.getWaitOrdersList(info);

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran orders controller : wait orders laoded');
      // debugPrint('tran wait odrers controller wait orders : ${response.body}');

      _orders = []; //initialze to not repeat data
      List<dynamic> map = response.body;
      _orders = map.map((elemnt) => OrderModel.fromJson(elemnt)).toList();

      // _orders.forEach((element) {
      //   debugPrint(element.toString());
      // });

      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran orders controller : could not get wait orders');
    }
  }

  Future<void> getAllOrders(Map<String, dynamic> info) async {
    _isLoaded = false;
    Response response = await transporterOrdersRepo.getAllOrdersList(info);

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('tran orders controller : all orders laoded');
      // debugPrint('tran odrers controller all orders: ${response.body}');

      _orders = []; //initialze to not repeat data
      List<dynamic> map = response.body[2];

      _orders = map.map((elemnt) => OrderModel.fromJson(elemnt)).toList();
      // _orders.forEach((element) {
      //   debugPrint(element.toString());
      // });

      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('tran orders controller : could not get all orders');
    }
  }
}
