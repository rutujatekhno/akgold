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
import 'package:sizer/sizer.dart';
import 'common/theme.dart';
import 'controller/auth_controller.dart';
import 'controller/orderchekout_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle((
  SystemUiOverlayStyle(
    statusBarColor: Color(0xff7B3F00)
  )
  ));
  Get.put(ApiService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build( context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Ak Golden Crust',
          theme: lightBrownTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL_ROUTE,
          // home:  SimpleCalender(),
        );
      },
    );
  }
}