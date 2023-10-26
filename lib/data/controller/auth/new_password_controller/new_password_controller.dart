import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/data/controller/auth/otp_controller/forgot_pass_repo.dart';
import 'package:http/http.dart' as http;
import 'package:renti_host/utils/app_utils.dart';

class NewPasswordController extends GetxController {
  final String apiUrl = '${ApiUrlContainer.baseUrl}user/update-password';
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final forgetPassController = Get.put(ForgetPasswordController());

  Future<void> resetPassword(String email, String newPassword) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'email': forgetPassController.emailController.value.text,
        },
        body: jsonEncode({'password': confirmPasswordController.value.text}),
      );

      if (response.statusCode == 200) {
        // Password reset successful
        // You can handle the response here if needed
        if (kDebugMode) {
          print('Password reset successful');
        }
        Get.offAllNamed(AppRoute.signInScreen);
        Utils.toastMessage("Password updated successfully");
      } else {
        // Password reset failed
        // You can handle errors here, e.g., show a snack bar or dialog
        if (kDebugMode) {
          print('Password reset failed');
          print(response.statusCode);
        }
        Utils.toastMessage('Password reset failed');
        Utils.toastMessage('Enter Valid Password');
      }
    } catch (error) {
      // Handle any network or other errors
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}
