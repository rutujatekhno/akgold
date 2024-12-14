import 'package:get/get.dart';

class BottomNavigationController extends GetxController{

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  void resetSelectedIndex() {
    selectedIndex.value = 0; // Reset to the default index
  }
}