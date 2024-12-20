import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/create_cafe_order_model.dart';

class OrderController extends GetxController {
  var orderNumber = ''.obs;
  var cafeName = ''.obs;
  var paymentTerm = ''.obs;
  var selectedDate = ''.obs;
  var  routeId = ''.obs;

  var products = <Products>[].obs;

  void setDate(String date) {
    selectedDate.value = date;
  }

  CreateCafeOrderModel createOrderModel() {
    return CreateCafeOrderModel(
      // cafeId: 5,
      routeId: 25,
      orderNumber: orderNumber.value,
      orderDate: selectedDate.value,
      // totalAmount: 4200,
      // tax: 0,
      // deliveryCharges: 0,
      // paymentStatus: 1,
      // paymentTermId: 1,
      products: products,
    );
  }


  // Clear form data
}
