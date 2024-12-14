import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class ResendOtpScreen extends StatelessWidget {
  const ResendOtpScreen({super.key});

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
              SizedBox(height: 25.h),
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 3.h),
                          Text(
                            "Verify your email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: 'Please enter your verification code ',
                                  style: TextStyle(color: Colors.grey,)),
                              TextSpan(
                                  text: 'we sent to your ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              TextSpan(
                                  text: 'email address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              TextSpan(
                                  text: 'to complete the verification ',
                                  style: TextStyle(color: Colors.grey,)),
                              TextSpan(
                                  text: 'process ',
                                  style: TextStyle(color: Colors.grey,)),
                            ]),
                            textAlign: TextAlign.center,
                          ),
      
                          SizedBox(height: 3.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: List.generate(6, (index) => _buildOtpField()),
                                  ),
                                  SizedBox(height: 5.h),
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 90.w,
                                          height: 6.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Handle OTP verification
                                              // Get.toNamed('/create_password');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              // backgroundColor: Colors.brown,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(color: Colors.brown),
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                            ),
                                            child: Text(
                                              "Resend the code",
                                              style: TextStyle(
                                                color: Colors.brown,
                                                fontSize: 15.sp, // Responsive font size
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
}


Widget _buildOtpField() {
  return SizedBox(
    height: 6.h,
    width: 12.w,
    child: TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18.sp),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    ),
  );
}
