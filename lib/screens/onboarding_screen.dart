import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 51.h,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffF2ECE6),
                ),
                child: Image.asset(
                  'assets/images/Ellipse2.png',

                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Column(
            children: [
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                    children: const [
                      TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(color: Color(0xff7B3F00)),
                      ),
                      TextSpan(text: "Our Sweet \n Bakery Heaven!"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Nisi do sunt veniam esse quis ex labore Lorem et. Excepteur labore minim ea ea ",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.h,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.w),
              //   child: SizedBox(
              //     width: 80.w,
              //     height: 6.h,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Get.toNamed('/login');
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Color(0xff7B3F00),
              //         shape: RoundedRectangleBorder(
              //           borderRadius:
              //           BorderRadius.circular(3),
              //         ),
              //       ),
              //       child: Text(
              //         "Lets Get Started",
              //         style: GoogleFonts.poppins(
              //           fontWeight: FontWeight.w400,
              //           color: Colors.white,
              //           fontSize: 16.sp,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 150,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
