import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/utils/app_utils.dart';

class ResentOtp {
  static String apiUrl =
      "${ApiUrlContainer.baseUrl}${ApiUrlContainer.forgotPassEndPoint}";

  static Future<void> resendOtp({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 201) {
        Utils.toastMessage("Sent One Time OTP in you email");
      } else {
        Utils.toastMessage("Enter Valid Email");
      }
    } on Exception catch (error) {
      Utils.toastMessage("Error : $error");
    }
  }
}
