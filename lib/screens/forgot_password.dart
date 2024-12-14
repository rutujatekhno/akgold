import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
          child: SingleChildScrollView(
            // reverse: true,
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Center(
                  child: SizedBox(
                    height: 82.h,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.w),
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            Text(
                              "Forgot Password?",
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w600,
                                fontSize: 19.sp,
                                // color: Colors.brown
                              ),
                            ),
                            SizedBox(height: 7.h),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Contact No Field
                                   Text("  Email",style: GoogleFonts.inter(fontWeight: FontWeight.w700),),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 1.h),
                                    child: TextFormField(
                                      // keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter your email',
                                        hintStyle: TextStyle(color: Colors.black26),

                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.brown, width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey, width: 1),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your contact number";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  // Resend OTP Link
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        // Your resend OTP logic here
                                        // Get.toNamed('/verify_otp');
                                      },
                                      child:  Text(
                                        "Resend Again",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  // Send OTP Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 6.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // if (_formKey.currentState?.validate() ?? false) {
                                        Get.toNamed('/verify_otp');
                                      },
                                      // },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff7B3F00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                      ),
                                      child: Text(
                                        "Send OTP",
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
      ),
    );
  }
}
