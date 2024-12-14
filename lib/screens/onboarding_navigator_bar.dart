import 'package:ak_golden_project/screens/bakery_track_screen.dart';
import 'package:ak_golden_project/screens/lauch_screen.dart';
import 'package:ak_golden_project/screens/login_screen.dart';
import 'package:ak_golden_project/screens/onboarding_screen.dart';
import 'package:ak_golden_project/screens/placeholder_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';


class OnboardingNavigatorBar extends StatelessWidget {
  const OnboardingNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // OnboardingSlider
        OnBoardingSlider(
          finishButtonText: 'Lets Get Started!',
          onFinish: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          finishButtonStyle: FinishButtonStyle(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          skipTextButton: Text(
            'Skip',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.brown,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailingFunction: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          controllerColor: Colors.brown,
          totalPage: 4,
          headerBackgroundColor: Colors.transparent,
          pageBackgroundColor: Colors.white,
          background: [
            Image.asset(
              'assets/images/iPhone.png',
              height: 400,
            ),
            Image.asset(
              'assets/images/iPhone1.png',
              height: 400,
            ),
            Image.asset(
              'assets/images/iPhone2.png',
              height: 400,
            ),
            Image.asset(
              'assets/images/iPhone2.png',
              height: 400,
            ),
          ],
          speed: 1.8,
          pageBodies: [
            LaunchScreen(),
           PlaceholderScreen(),
           BakeryTrackScreen(),
            const OnboardingScreen(),
          ],
        ),
      ],
    );
  }

  /// Helper method to create a screen with a back button
  Widget _buildPageWithBackButton(BuildContext context, Widget child) {
    return Stack(
      children: [
        child,
        Positioned(
         bottom: 0,
          left: 10,
          child: GestureDetector(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.brown, width: 2),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.brown,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
