import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/income/income/income_repo/income_repo.dart';
import 'package:renti_host/view/screens/income/income/income_response_model/income_response_model.dart';

class IncomeController extends GetxController {
  IncomeRepo incomeRepo;
  IncomeController({required this.incomeRepo});

  Future<IncomeResponseModel> totalIncome() async {
    ApiResponseModel responseModel = await incomeRepo.totalIncome();
    IncomeResponseModel incomeResponseModel; // Define the variable here

    if (responseModel.statusCode == 200) {
      incomeResponseModel = IncomeResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if (kDebugMode) {
        print("$incomeResponseModel");
      }
    } else {
      Utils.toastMessage(responseModel.message);
      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return IncomeResponseModel(); // Return a default value or handle the error accordingly.
    }
    return incomeResponseModel; // Return the variable here
  }
}