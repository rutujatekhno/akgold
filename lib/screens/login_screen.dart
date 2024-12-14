import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Container(
        // height: 500.h,
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
                "Welcome",
                style: GoogleFonts.encodeSans(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFF4D0),
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 62.h,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      reverse: false,
                      child: Column(
                        children: [
                          Text(
                            "Log in",
                            style: GoogleFonts.encodeSans(
                              // color: Colors.brown,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Form(
                              onChanged: () {
                                if(Get.find<AuthController>().loginFormKey.currentState?.validate() ?? false){
                                  Get.find<AuthController>().login();
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Username",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  TextFormField(
                                    controller: authController.usernameController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter username',
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.brown, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter your email";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "  Password",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  Obx(
                                    () => TextFormField(
                                      controller: authController.passwordController,
                                      obscureText: !authController
                                          .isPasswordVisible.value,
                                      decoration: InputDecoration(
                                        // Removed const keyword
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            authController
                                                    .isPasswordVisible.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            authController
                                                .togglePasswordVisibility();
                                          },
                                        ),
                                        hintText: 'Enter password',
                                        hintStyle:
                                            const TextStyle(color: Colors.black26),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.brown, width: 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
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
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap: () {
                                  //         Get.toNamed('/forgot_password');
                                  //       },
                                  //       child: Text(
                                  //         "Forgot password?",
                                  //         style: GoogleFonts.inter(
                                  //             color: Colors.brown,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  SizedBox(height: 4.h),
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 90.w,
                                          height: 6.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.find<AuthController>()
                                                  .login();
                                              // authController.login();
                                              // Get.toNamed('/bottom_screen');
                                              // Get.toNamed('/dashboard_screen');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff7B3F00),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                            ),
                                            child: Text(
                                              "Log in",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
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
