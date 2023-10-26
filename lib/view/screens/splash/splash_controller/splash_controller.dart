import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

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
}