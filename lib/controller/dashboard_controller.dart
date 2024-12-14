import 'package:get/get.dart';

class DashboardController extends GetxController {

  var isNewOrderSelected = true.obs;

  void selectNewOrder() {
    isNewOrderSelected.value = true;
  }

  void selectRepeatOrder() {
    isNewOrderSelected.value = false;
  }
}
