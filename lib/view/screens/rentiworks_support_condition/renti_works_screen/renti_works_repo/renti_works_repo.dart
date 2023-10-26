import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';

class RentiWorksRepo {
  ApiService apiService;
  RentiWorksRepo({required this.apiService});

  Future<ApiResponseModel> howRentiWork() async {
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.howRentiWork}";
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, null, passHeader: true);

    return responseModel;
  }
}
