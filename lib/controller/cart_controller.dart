import 'package:get/get.dart';

class CartController extends GetxController {
  var quantity = 0.obs;
  var price = 0.obs;

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
  }
