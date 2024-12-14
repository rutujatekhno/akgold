import 'package:ak_golden_project/controller/checkbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../controller/auth_controller.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckBoxController checkBoxController = Get.put(CheckBoxController());
    final AuthController authController = Get.put(AuthController());

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
                      child: Column(
                        children: [
                          SizedBox(height: 1.h),
                          Text(
                            "Create Password",
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Color(0xff171A1F),
                            ),
                          ),
                          Text("Create a new password to log in",
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                color: Colors.black26,
                                fontSize: 13,
                              )),
                          SizedBox(height: 3.h),
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Password Field
                                 Text(
                                  "Create Password",
                                  style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                                ),
                                Obx(() {
                                  return TextFormField(
                                    controller:
                                        authController.createPasswordController,
                                    obscureText: !authController
                                        .isCreatePasswordVisible.value,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          authController
                                                  .isCreatePasswordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          authController
                                              .toggleCreatePasswordVisibility();
                                        },
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(color: Colors.black26),

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
                                  );
                                }),

                                SizedBox(height: 2.h),
                                // Confirm Password Field
                                Text(
                                  "Confirm Password",
                                  style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                                ),
                                Obx(() {
                                  return TextFormField(
                                    controller: authController
                                        .confirmPasswordController,
                                    obscureText: !authController
                                        .isConfirmPasswordVisible.value,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(color: Colors.black26),

                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          authController
                                                  .isConfirmPasswordVisible
                                                  .value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          authController
                                              .toggleConfirmPasswordVisibility();
                                        },
                                      ),
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
                                  );
                                }),
                                SizedBox(height: 1.h),
                                Obx(() {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: checkBoxController
                                              .isChecked.value,
                                          onChanged: (value) {
                                            checkBoxController.toggleCheckbox();
                                          },
                                          activeColor: Colors.brown,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            checkBoxController.toggleCheckbox();
                                          },
                                          child:  Text(
                                            "Remember me",
                                            style:
                                                GoogleFonts.manrope(color: Colors.brown,fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                SizedBox(height: 18.h),
                                // Continue Button
                                Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 6.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Success!!",
                                          titleStyle: TextStyle(color: Colors.green),
                                          middleText: "Password created",
                                          middleTextStyle: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 30,  // Icon size
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              const Text(
                                                "Password created",  // The text shown under the icon
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                          confirmTextColor: Colors.white,
                                          buttonColor: Colors.brown,
                                          confirm: TextButton(
                                            onPressed: () {
                                              Get.offAllNamed('/login');  // Navigate to the login screen when pressed
                                            },
                                            child: const Text(
                                              'Go to Login',  // Button text
                                              style: TextStyle(color: Colors.brown),
                                            ),
                                          ),
                                        );

                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff7B3F00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Text(
                                        "Continue",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                        ),
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
    );
  }
}
