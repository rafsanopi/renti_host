import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';

class ReviewRepo {
  ApiService apiService;
  ReviewRepo({required this.apiService});

  Future<ApiResponseModel> reviewRepo() async {
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.reviewGet}";
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, null, passHeader: true);

    return responseModel;
  }
}
