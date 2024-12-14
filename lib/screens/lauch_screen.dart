import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
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
                        'assets/images/iPhone.png',
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
                       TextSpan(text: "Discover Delight: "),
                      TextSpan(
                        text: "Explore Our Bakery",
                        style: TextStyle(color: Color(0xff7B3F00)),
                      ),
                      TextSpan(text: " Selection"),
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
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
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