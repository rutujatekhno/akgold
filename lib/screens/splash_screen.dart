import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/onboarding_bar');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, // Top color
              Color(0xFF7B3F00), // Bottom gradient color
            ],
            stops: [0.4491, 1.0], // Gradient stops to match your requirement
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              width: 200.w,
            ),
            // SizedBox(height: 2.h),
            Text(
              "AK Golden Crust",
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
