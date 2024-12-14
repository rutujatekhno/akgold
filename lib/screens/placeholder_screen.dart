import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height:  60.h,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffF2ECE6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 70.0),
                      child: Image.asset(
                        'assets/images/iPhone1.png',
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 50.0,
                  //   right: 16.0,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
                  //
                  //     },
                  //     child:  Text('Skip',style: GoogleFonts.inter(fontWeight: FontWeight.w600,color: Colors.brown,fontSize: 18),),
                  //   ),
                  // ),
                ],
              )
            ),
          ),
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
                  TextSpan(text: "Bookmark Your \n"),
                  TextSpan(
                    text: "Bakery Favourites",
                    style: TextStyle(color: Color(0xff7B3F00)),
                  ),
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
          // SizedBox(height: 4.h),
          // Padding(
          //   padding: EdgeInsets.only(top: 2,left: 20,),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed('/launch_screen');
                //     // Navigator.push(context, MaterialPageRoute(builder: (context) => LaunchScreen(),));
                //   },
                //   child: Container(
                //     padding:  EdgeInsets.all(8),
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.white,
                //       border: Border.all(
                //         color: Colors.brown,
                //         width: 2
                //       )
                //     ),
                //     child: const Icon(
                //       Icons.arrow_back,
                //       color: Colors.brown
                //     ),
                //   ),
                // ),
          //       SizedBox(width: 10.w),
          //       Obx(
          //         () => Row(
          //           children: List.generate(3, (index) {
          //             return Container(
          //               margin: const EdgeInsets.symmetric(horizontal: 4),
          //               width: 10,
          //               height: 10,
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: controller.currentIndex.value == index
          //                     ? const Color(0xff7B3F00)
          //                     : Colors.white,
          //                 border: Border.all(
          //                   width: 1,
          //                   color: Color(0xff7B3F00)
          //                 )
          //               ),
          //             );
          //           }),
          //         ),
          //       ),
          //       SizedBox(width: 10.w),
          //       GestureDetector(
          //         // onTap: controller.navigateNext,
          //         onTap: () {
          //           // Navigator.push(context, MaterialPageRoute(builder: (context) => BakeryTrackScreen(),));
          //           Get.toNamed('/bakery_track_screen');
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
      size.height - 130,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
