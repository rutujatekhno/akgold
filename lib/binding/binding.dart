import 'package:ak_golden_project/controller/orderchekout_controller.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/bottom_navigation_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

}

  class OrderCheckoutBinding extends Bindings{
    @override
  void dependencies (){
      Get.lazyPut<OrderCheckoutController>(() => OrderCheckoutController());
  }
  }

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
  }
}

