import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController{

  final String apiUrl = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.changePassword}";
  final currentPassword = TextEditingController().obs;
  final newPassword = TextEditingController().obs;
  final reTypedPassword = TextEditingController().obs;

  RxBool loading = false.obs;

  Future<void> changePass (String current, String newPass,String conPass) async{
    try {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('email');
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': "$accessToken",
          'currentPassword': currentPassword.value.text,
          'newPassword': newPassword.value.text,
          'reTypedPassword': reTypedPassword.value.text,
        }),
      );

      if (response.statusCode == 200) {
        clearData();
        // Password Change successful
        // You can handle the response here if needed
        if (kDebugMode) {
          print('Password changed successfully');
        }
        Get.back();
        Utils.toastMessage("Password changed successfully");
      } else {
        // Password Change failed
        // You can handle errors here, e.g., show a snack bar or dialog
        if (kDebugMode) {
          print('Password changed failed');
          print(response.statusCode);
        }
        Utils.toastMessage('New password and Confirm password do not match');
      }
    } catch (error) {
      // Handle any network or other errors
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
  void clearData() {
    loading = false.obs;
    currentPassword.value.text = '';
    newPassword.value.text = '';
    reTypedPassword.value.text = '';
  }
}