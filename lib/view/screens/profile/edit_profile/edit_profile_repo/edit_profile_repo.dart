import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileRepo {
  ApiService apiService;
  EditProfileRepo({required this.apiService});

  Future<ApiResponseModel> editProfile(
      {required String email,
      required String image,
      required String fullName,
      required String phoneNumber,
      required String dateOfBirth,
      required String gender,
      required String creaditCardNumber,
      required String address}) async {
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString(SharedPreferenceHelper.userIdKey);

    String uri =
        "${ApiUrlContainer.baseUrl}${ApiUrlContainer.editProfile + userID.toString()}";

    String requestMethod = ApiResponseMethod.postMethod;
    Map<String, dynamic> params = {
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "fullName": fullName,
      "creaditCardNumber": creaditCardNumber,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "KYC": "kyc",
      "RFC": "rfc",
      "image": image,
      "password": "11223344",
    };

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}
