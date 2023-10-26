import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_utils.dart';

class VerifyEmailRepo {
  ApiService apiService;
  VerifyEmailRepo({required this.apiService});

  Future<ApiResponseModel> verifyEmail(
      {required String otp, required String email}) async {
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.emailVerify}";

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> parems = {
      "oneTimeCode": otp,
      "email": email,
    };

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, parems, passHeader: true);

    if (responseModel.statusCode == 200) {
      Utils.toastMessage(responseModel.message);
      Get.offNamed(AppRoute.signInScreen);
    } else {
      Utils.toastMessage(responseModel.message);
    }

    return responseModel;
  }
}
