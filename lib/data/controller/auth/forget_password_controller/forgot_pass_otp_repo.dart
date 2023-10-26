import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/data/controller/auth/otp_controller/forgot_pass_repo.dart';
import 'package:renti_host/utils/app_utils.dart';

class OTPController extends GetxController {
  final String apiUrl = 'http://192.168.10.14:3001/api/user/verify-code';
  final controllerOTP = TextEditingController().obs;
  final forgetPassController = Get.put(ForgetPasswordController());

  Future<void> verifyOTP(String oneTimeCode, String email) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'email': forgetPassController.emailController.value.text,
        },
        body: jsonEncode({'oneTimeCode': controllerOTP.value.text}),
      );

      if (response.statusCode == 200) {
        // OTP verification successful
        // You can handle the response here if needed
        if (kDebugMode) {
          print('User verified successfully');
        }
        Get.toNamed(AppRoute.newPasswordScreen);
        Utils.toastMessage("User verified successfully");
      } else {
        // OTP verification failed
        // You can handle errors here, e.g., show a snack bar or dialog
        if (kDebugMode) {
          print('User verification failed');
        }
        if (kDebugMode) {
          print("${response.statusCode}");
        }
      }
    } catch (error) {
      // Handle any network or other errors
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}
