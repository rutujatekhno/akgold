import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w), // Responsive padding
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                    ),
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                        SizedBox(height: 2.h),
                        Form(
                          // key: loginKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your email',
                                    prefixIcon: Icon(
                                      Icons.person_2,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your username";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                    Icon(Icons.lock, color: Colors.grey),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    hintText: 'Enter password',
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
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.login, color: Colors.brown),
                                    Text(" Remember me"),
                                    Spacer(),
                                    Text("Forgot Password?"),
                                  ],
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/dashboard_screen');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.brown,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19.sp),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                    const Icon(Icons.facebook, color: Colors.blue),
                                  ),
                                  myIcon(FontAwesomeIcons.google),
                                  const SizedBox(),
                                ],
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
    );
  }
}

Widget myIcon(IconData icon) {
  return IconButton(
    onPressed: () {},
    icon: Icon(
      icon,
      size: 19,
    ),
  );
}
