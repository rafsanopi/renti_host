import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';

class RentListRepo {
  ApiService apiService;
  RentListRepo({required this.apiService});

  Future<ApiResponseModel> rentList() async {
    //Rent Request Url
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentList}";
    //Rent Request Method
    String requestMethod = ApiResponseMethod.getMethod;
    //Sent Request by using ApiResponseModel and send header Authorization
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    //Return The Response
    return responseModel;
  }
}
