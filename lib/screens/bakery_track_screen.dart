import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BakeryTrackScreen extends StatelessWidget {
  BakeryTrackScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // SizedBox(
          //   height: 5.h,
          // ),
          SizedBox(
            height: 60.h,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffF2ECE6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Image.asset(
                    'assets/images/iPhone4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
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
                    children: [
                      TextSpan(
                        text: "Track the Journey of",
                        style: const TextStyle(color: Color(0xff7B3F00)),
                      ),
                      TextSpan(text:  "Your Bakery Desires"),
                    ],
                  ),
                ),
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
              // SizedBox(
              //   height: 4.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.w),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       GestureDetector(
              //         // onTap: _controller.navigatePrevious,
              //         onTap: () => Get.back(),
              //         child: Container(
              //           padding: const EdgeInsets.all(8),
              //           decoration:  BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.white,
              //             border: Border.all(
              //               width: 2,
              //               color: Colors.brown
              //             )
              //           ),
              //           child: const Icon(
              //             Icons.arrow_back,
              //             color: Colors.brown,
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 10.w,),
              //       Obx(
              //             () => Row(
              //           children: List.generate(3, (index) {
              //             return Container(
              //               margin: const EdgeInsets.symmetric(horizontal: 4),
              //               width: 10,
              //               height: 10,
              //               decoration: BoxDecoration(
              //                 shape: BoxShape.circle,
              //                 color: _controller.currentIndex.value == index
              //                     ? const Color(0xff7B3F00)
              //                     : Colors.white,
              //                 border: Border.all(
              //                   color:const Color(0xff7B3F00),
              //                   width: 1
              //                 )
              //               ),
              //             );
              //           }),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.w,
              //       ),
              //       GestureDetector(
              //         // onTap: controller.navigateNext,
              //         onTap: () {
              //           // Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
              //           Get.toNamed('/onboarding_screen');
              //
              //         },
              //         child: Container(
              //           padding: const EdgeInsets.all(12),
              //           decoration: const BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Color(0xff7B3F00),
              //           ),
              //           child: const Icon(
              //             Icons.arrow_forward,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ],
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