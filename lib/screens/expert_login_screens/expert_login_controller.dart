import 'package:bhooskhalan/screens/homescreen.dart';
import 'package:bhooskhalan/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpertLoginController extends GetxController {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

 void login() async {
  final mobile = mobileController.text.trim();
  final password = passwordController.text.trim();
  const usertype = "Geo-Scientist";

  if (mobile.isEmpty || password.isEmpty) {
    Get.snackbar("Error", "Please enter both mobile and password");
    return;
  }

  isLoading.value = true;

  try {
    final endpoint =
        '/Login/tocken?mobile=$mobile&password=$password&usertyp=$usertype';
    
    final response = await ApiService.put(endpoint);

    if (response['status'] == 'Success') {
      final token = response['token'];
      // Store token if needed using GetStorage or SharedPreferences

      Get.snackbar("Success", "Login successful");
      Get.off(() => const HomeScreen());
    } else {
      Get.snackbar("Login Failed", response['message'] ?? 'Unknown error');
    }
  } catch (e) {
    Get.snackbar("Error", "Something went wrong: $e");
  } finally {
    isLoading.value = false;
  }
}

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
