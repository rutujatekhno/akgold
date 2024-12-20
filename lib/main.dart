import 'package:ak_golden_project/common/simple_calender.dart';
import 'package:ak_golden_project/routes/app_pages.dart';
import 'package:ak_golden_project/screens/bakery_track_screen.dart';
import 'package:ak_golden_project/screens/lauch_screen.dart';
import 'package:ak_golden_project/screens/onboarding_navigator_bar.dart';
import 'package:ak_golden_project/screens/placeholder_screen.dart';
import 'package:ak_golden_project/service/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_slider/onboarding_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'common/theme.dart';
import 'controller/auth_controller.dart';
import 'controller/orderchekout_controller.dart';

void main() async {
  // Ensure initialization before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Set the status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff7B3F00),  // Set your status bar color here
  ));

  // Initialize ApiService (assuming you use GetX for dependency injection)
  Get.put(ApiService());

  // Check login status before running the app
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // Run the app with the login state passed in
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Ak Golden Crust',
          theme: lightBrownTheme,  // Your custom theme
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: isLoggedIn ? AppPages.BOTTOM_SCREEN : AppPages.SPLASH, // Dynamically set initial route based on login status
        );
      },
    );
  }
}