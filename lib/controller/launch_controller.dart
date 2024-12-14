import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/placeholder_screen.dart';

class LaunchController extends GetxController {
  var currentIndex = 0.obs;
  final PageController pageController = PageController();


  final List<Widget> screens = [
    PlaceholderScreen(),
    // BakeryTrackScreen()
    // Add more screens here
  ];

  void navigateNext() {
    if (currentIndex.value < screens.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }

    Get.off(() => screens[currentIndex.value], transition: Transition.rightToLeft);
  }

  void navigatePrevious() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
    // Get.back();
    // Get.off(() => screens[currentIndex.value], transition: Transition.fade); // Use Get.off

  }
}
