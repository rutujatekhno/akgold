
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CommonController extends GetxController{

  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}