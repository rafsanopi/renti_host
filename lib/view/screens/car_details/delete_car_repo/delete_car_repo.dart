import 'package:renti_host/core/global/api_response_method.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_utils.dart';

class DeleteCarRepo {
  ApiService apiService;
  DeleteCarRepo({required this.apiService});

  Future<ApiResponseModel> deleteCar({required String carId}) async {
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.deleteCar}$carId";

    String requestMethod = ApiResponseMethod.deleteMethod;

    ApiResponseModel responseModel =
        await apiService.request(uri, requestMethod, null, passHeader: false);

    if (responseModel.statusCode == 200) {
      Utils.toastMessage(responseModel.message);
    } else {
      Utils.toastMessage(responseModel.message);
    }

    return responseModel;
  }
}
