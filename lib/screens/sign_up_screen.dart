import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/checkbox_controller.dart';

class SignUpScreen extends StatefulWidget {
   const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final CheckBoxController checkBoxController = Get.put(CheckBoxController());
  bool? value = false;

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
              SizedBox(height: 10.h),
              Image.asset(
                'assets/images/logo1.png',
                width: 50.w,
              ),
              SizedBox(height: 2.h),
              // Welcome Text
              Text(
                "Nice to see you! ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFF4D0),
                  fontSize: 22.sp,
                ),
              ),
              const Text('Create your account',style: TextStyle(  fontWeight: FontWeight.w700,
                color: Color(0xffFFF4D0),),),
              SizedBox(height: 5.h),
              // Login Card
              Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 3.h),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Form(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Email Field
                                    const Text("  Username",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.h),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your email',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter your email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const Text(" Email",style: TextStyle(fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.h),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter email',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter your email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    // Password Field
                                    const Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.h),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter password',
                                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                                          suffixIcon: Icon(Icons.remove_red_eye),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter your password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 1.h,),
                                    Padding(
                                      padding:  const EdgeInsets.all(5.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            tristate: true, // Example with tristate
                                            value: value,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                value = newValue;
                                              });
                                            },
                                            activeColor: Colors.greenAccent, // Example customization
                                            checkColor: Colors.white,
                                          ),
                                          const Text(
                                            'I agree with terms and conditions',
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 1.h,),
                                    Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 90.w,
                                            height: 5.h,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.toNamed('/dashboard_screen');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.brown,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                              ),
                                              child: Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,  // Responsive text size
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ))],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}}
