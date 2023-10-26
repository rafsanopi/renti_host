import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';

class SignInRepo {
  ApiService apiService;
  SignInRepo({required this.apiService});

  Future<ApiResponseModel> signInUser(
      {required String email, required String password}) async {
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.signInEndPoint}";
    String requestMethod = ApiResponseMethod.postMethod;
    Map<String, String> params = {"email": email, "password": password};

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}
