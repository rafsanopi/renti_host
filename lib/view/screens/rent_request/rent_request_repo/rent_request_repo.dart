import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_utils.dart';

class RentReqRepo {
  ApiService apiService;
  RentReqRepo({required this.apiService});

  Future<ApiResponseModel> rentRequest(
      {required Request request, required String id}) async {
    String uri =
        "${ApiUrlContainer.baseUrl}${ApiUrlContainer.rentAccerpAndReject}$id";
    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> parems = {
      "request": request == Request.accepted ? "Accepted" : "Rejected"
    };

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, parems, passHeader: true);

    if (responseModel.statusCode == 200) {
      Utils.toastMessage(responseModel.message);
    } else {
      Utils.toastMessage(responseModel.message);
    }

    return responseModel;
  }
}

enum Request { accepted, rejected }
