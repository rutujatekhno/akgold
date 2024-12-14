import 'package:ak_golden_project/binding/binding.dart';
import 'package:ak_golden_project/screens/bakery_track_screen.dart';
import 'package:ak_golden_project/screens/bill_details.dart';
import 'package:ak_golden_project/screens/create_password_screen.dart';
import 'package:ak_golden_project/screens/forgot_password.dart';
import 'package:ak_golden_project/screens/home_screen.dart';
import 'package:ak_golden_project/screens/login_screen.dart';
import 'package:ak_golden_project/screens/onboarding_navigator_bar.dart';
import 'package:ak_golden_project/screens/onboarding_screen.dart';
import 'package:ak_golden_project/screens/order_checkout_screen.dart';
import 'package:ak_golden_project/screens/order_history_screen.dart';
import 'package:ak_golden_project/screens/placeholder_screen.dart';
import 'package:ak_golden_project/screens/profile_screen.dart';
import 'package:ak_golden_project/screens/resend_otp_screen.dart';
import 'package:ak_golden_project/screens/sign_in_screen.dart';
import 'package:ak_golden_project/screens/verify_otp_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../common/main_layout.dart';
import '../screens/dashboard_screen.dart';
import '../screens/lauch_screen.dart';
import '../screens/splash_screen.dart';


class AppPages {
  static const INITIAL_ROUTE = '/splash';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      // binding: splash_screen(),
    ),
    GetPage(
        name: '/onboarding_bar',
        page: ()=> OnboardingNavigatorBar(),
    ),
    GetPage(
      name: '/launch_screen',
      page: () =>  LaunchScreen(), transition: Transition.leftToRight// Corrected line
    ),
    GetPage(
      name: '/placeholder_screen',
      page: () => const PlaceholderScreen(),
    ),
    GetPage(
      name: '/bakery_track_screen',
      page: () =>  BakeryTrackScreen(),transition: Transition.rightToLeft
    ),
    GetPage(
        name: '/onboarding_screen',
        page: () => OnboardingScreen(),transition: Transition.rightToLeft
    ),
    GetPage(
      name: '/login',
      page: () =>  LoginScreen(),
    ),
    GetPage(
      name: '/bottom_screen',
      page: () =>  BottomNavigationScreens(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: '/home_screen',
      page: () =>  HomeScreen(),
    ),
    GetPage(
        name: '/signin_screen',
        page: () => const SignInScreen()
      // binding: login_screen(),
    ),
    GetPage(
      name: '/dashboard_screen',
      page: () =>  DashboardScreen(),
    ),
    // GetPage(name: '/neworder',
    //     page: () => NewOrderForm()
    // ),
    // GetPage(name: '/repeat_order',
    //     page: () => NewOrderForm()
    // ),
    GetPage(
        name: '/ordercheckout_screen',
        page: () =>  OrderCheckoutScreen(),
        binding: OrderCheckoutBinding()
    ),
    GetPage(
      name: '/orderhistory_screen',
      page: () =>  OrderHistoryScreen(),
    ),
    GetPage(
      name: '/billdetails',
      page: () => const BillDetails(),
    ),
    GetPage(
        name: '/forgot_password',
        page: () => const ForgotPassword()
    ),
    GetPage(
      name: '/verify_otp',
      page: () => const VerifyOtpScreen(),
    ),
    GetPage(
      name: '/resend_otp_screen',
      page: () => const ResendOtpScreen(),
    ),
    GetPage(
        name: '/create_password',
        page: () => const CreatePasswordScreen()
    ),
    GetPage(
        name: '/profile_screen',
        page: () =>  ProfileScreen()
    ),
  ];
}