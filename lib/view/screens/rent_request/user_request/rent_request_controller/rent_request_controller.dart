import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_repo/rent_request_repo.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_response_model/rent_request_response_model.dart';

class RentRequestController extends GetxController {
  RentRequestRepo rentRequestRepo;
  RentRequestController({required this.rentRequestRepo});

  @override
  void onInit() {
    rentRequest();
    super.onInit();
  }

  bool isloading = true;

  RentRequestResponseModel rentRequestResponseModel =
      RentRequestResponseModel();

  Future<void> rentRequest() async {
    //Call the Api by using ApiResponse Model data
    ApiResponseModel responseModel = await rentRequestRepo.rentRequest();
    //Create a reference variable of RentRequestModel

    //Checking response data
    if (responseModel.statusCode == 200) {
      //get data by using reference model variable
      rentRequestResponseModel = RentRequestResponseModel.fromJson(
          jsonDecode(responseModel.responseJson));

      isloading = false;
      update();
    } else {
      Utils.toastMessage(responseModel.message);
    }
  }
}
