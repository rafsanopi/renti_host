import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:http/http.dart' as http;
import 'package:renti_host/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInController extends GetxController{

 // LoginRepository loginRepository;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  //LogInController({required this.loginRepository});
  Future<void> loginUser() async {
    loading = true.obs;
    try {
      loading = true.obs;
      // API endpoint URL
      final apiUrl = Uri.parse('http://192.168.10.14:3001/api/user/sign-in');

      // User credentials
      final credentials = {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      };

      // Make a POST request to the login API
      final response = await http.post(apiUrl, body: credentials);

      loading = false.obs;
      // Check if the response is successful
      if (response.statusCode == 200) {
        loading = false.obs;
        if (kDebugMode) {
          print(response.statusCode);
        }
        final responseData = jsonDecode(response.body);
        final email = responseData["user"]["email"];
        final accessToken = responseData["accessToken"];

        // Save the access token using shared_preferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setString('accessToken', accessToken);
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print(prefs.getString("email"));
        }
        // Navigate to the next screen (Home Page)
        Get.offAllNamed(AppRoute.navigation);
        Utils.toastMessage("Successfully Signed In");
        if (kDebugMode) {
          print("Successfully Signed In");
        }
      } else {
        // Handle login failure (e.g., show an error message)
        if (kDebugMode) {
          print('Login failed: ${response.body}');
        }
        // You can show an error message here if needed
        Utils.toastMessage("Authentication failed");
      }
    } catch (error) {
      // Handle any network or other errors
      if (kDebugMode) {
        print('Error occurred: $error');
      }
      // You can show an error message here if needed
      Utils.snackBar("ERROR", "$error");
    }
  }


  // Function to check if the user is logged in
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('email');
    return accessToken != null;
  }

  // Function to logout and clear the access token
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  void clearData() {
    loading = false.obs;
    emailController.value.text = '';
    passwordController.value.text = '';
  }
}
