import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff7B3F00),
                Color(0xff0B0A0A),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: SingleChildScrollView(
                      // reverse: true,
                      child: Column(
                        children: [
                          SizedBox(height: 3.h),
                          Text(
                            "Verify your email",
                            style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                // color: Colors.brown
                            ),
                          ),
                          SizedBox(height: 3.h),
                          RichText(
                            text:  TextSpan(children: [
                              TextSpan(
                                  text: 'Please enter your verification code ',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    fontSize: 15
                                  )),
                              TextSpan(
                                  text: 'we sent to your ',
                                  style: GoogleFonts.inter(
                                    // fontWeight: FontWeight.w400,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    // fontSize: 17.sp,
                                  )),
                              TextSpan(
                                  text: 'email address',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text: ' to complete the verification ',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text: 'process ',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    // fontSize: 17.sp,
                                  )),
                            ]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                        6,
                                        (index) => _buildOtpField(
                                            context)), // Dynamically created
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Handle resend OTP
                                          Get.toNamed('/resend_otp_screen');
                                        },
                                        child:  Text(
                                          "Resend Again",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 6.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed('/create_password');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff7B3F00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                      child: Text(
                                        "Verify",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 12.w,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(fontSize: 18.sp),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
