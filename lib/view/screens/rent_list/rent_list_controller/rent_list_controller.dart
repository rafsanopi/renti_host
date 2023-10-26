import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_model/rent_list_model.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_repo/rent_list_repo.dart';

class RentListController extends GetxController {
  RentListRepo rentListRepo;
  RentListController({required this.rentListRepo});

  bool isLoading = false;

  RentListModel rentListModel = RentListModel();

  Future<RentListModel> rentList() async {
    isLoading = true;
    update();
    ApiResponseModel responseModel = await rentListRepo.rentList();
    // Define the variable here

    if (responseModel.statusCode == 200) {
      rentListModel = RentListModel.fromJson(jsonDecode(responseModel.responseJson));
      isLoading = false;
      update();
      if (kDebugMode) {
        print("$rentListModel");
      }
    } else {
      isLoading = false;
      update();
      Utils.toastMessage(responseModel.message);

      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return RentListModel(); // Return a default value or handle the error accordingly.
    }
    return rentListModel; // Return the variable here
  }
}