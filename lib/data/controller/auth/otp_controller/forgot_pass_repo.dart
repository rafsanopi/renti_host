import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_utils.dart';

class ForgetPasswordController extends GetxController {
  final String apiUrl =
      "${ApiUrlContainer.baseUrl}${ApiUrlContainer.forgotPassEndPoint}";

  final emailController = TextEditingController().obs;

  Future<void> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': emailController.value.text}),
      );

      if (response.statusCode == 201) {
        Get.toNamed(AppRoute.forgotPasswordOTPScreen);
        Utils.toastMessage("Sent One Time OTP in you email");
      } else {
        Utils.toastMessage("Enter Valid Email");
      }
    } catch (error) {
      // Handle any network or other errors
      if (kDebugMode) {
        print('Error: $error');
      }
      Utils.toastMessage("Error : $error");
    }
  }
}
