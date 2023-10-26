import 'dart:io';

import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';

class SignUpRepo {
  ApiService apiService;
  SignUpRepo({required this.apiService});

  Future<ApiResponseModel> createUser({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String gender,
    required String address,
    required String dateOfBirth,
    required String password,
    required String rfc,
    required List<File> kycImages,
    required File profileImage,
    required String ineNumber,
  }) async {
    String url = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.signUpEndPoint}";

    String responseMethod = ApiResponseMethod.postMethod;

    Map<String, dynamic> params = {
      "fullName": fullName,
      "email": email,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "password": password,
      "phoneNumber": phoneNumber,
      "address": address,
      "KYC": kycImages,
      "RFC": rfc,
      "ine": ineNumber,
      "image": profileImage,
      "role": "user"
    };

    ApiResponseModel responseModel = await apiService
        .request(url, responseMethod, params, passHeader: false);

    return responseModel;
  }
}
