import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/api.dart';
import 'allcafename_controller.dart';


class AuthController extends GetxController {
  var isLoading = false.obs;

  var isPasswordVisible = false.obs;
  var isCreatePasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

//   Login screen
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController createPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginFormKey => _loginKey;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle visibility for the create password field
  void toggleCreatePasswordVisibility() {
    isCreatePasswordVisible.value = !isCreatePasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  final ApiService apiService = ApiService();

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    // Validate input fields
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Username and password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final body = {'username': username, 'password': password};

      // Make API call
      final response = await apiService.post('/loginCafeUser', body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['token'] != null) {
          final token = responseData['token'];

          try {
            // Decode token to extract user details
            Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
            String cafeId = decodedToken['cafe_id'].toString();

            // Save token and cafeId in SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            await prefs.setString('cafe_id', cafeId);

            print('Decoded token: $decodedToken');

            // Show success snackbar before navigation
            Get.snackbar(
              'Success',
              'Login successful!',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              duration: Duration(milliseconds: 1500)
            );

            // Delay slightly to ensure snackbar is visible
            await Future.delayed(Duration(milliseconds: 500));

            // Navigate to the bottom screen
            await Get.toNamed('/bottom_screen');

            // Fetch cafes after successful navigation
            await Get.find<CafeController>().fetchCafes(cafeId: int.parse(cafeId));
          } catch (e) {
            Get.snackbar(
              'Error',
              'Failed to decode token or save preferences.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } else {
          Get.snackbar(
            'Error',
            'Token not found in the response.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        final responseData = json.decode(response.body);
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}