import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/term_condition_screen.dart/tc_model/tc_model.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/term_condition_screen.dart/tc_repo/tc_repo.dart';

class TermConditionController extends GetxController {
  TermConditionRepo termConditionRepo;
  TermConditionController({required this.termConditionRepo});

  Future<TermConditionModel> privacyPolicy() async {
    ApiResponseModel responseModel = await termConditionRepo.termCondition();
    TermConditionModel termCondition; // Define the variable here

    if (responseModel.statusCode == 200) {
      termCondition =
          TermConditionModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      Utils.toastMessage(responseModel.message);
      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return TermConditionModel(); // Return a default value or handle the error accordingly.
    }

    return termCondition; // Return the variable here
  }
}
