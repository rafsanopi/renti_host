import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/settings/privacy_policy/pp_repo/pp_repo.dart';
import 'package:renti_host/view/screens/settings/privacy_policy/pp_response_model/pp_response_model.dart';

class PrivacyPolicyController extends GetxController {
  PrivacyPolicyRepo privacyPolicyRepo;
  PrivacyPolicyController({required this.privacyPolicyRepo});

  Future<PrivacyPolicyModel> privacyPolicy() async {
    ApiResponseModel responseModel = await privacyPolicyRepo.privacyPolicy();
    PrivacyPolicyModel privacyPolicyModel; // Define the variable here

    if (responseModel.statusCode == 200) {
      privacyPolicyModel =
          PrivacyPolicyModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      Utils.toastMessage(responseModel.message);
      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return PrivacyPolicyModel(); // Return a default value or handle the error accordingly.
    }

    return privacyPolicyModel; // Return the variable here
  }
}
