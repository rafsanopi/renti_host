import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/renti_works_screen/renti_works_model/renti_works_model.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/renti_works_screen/renti_works_repo/renti_works_repo.dart';

class RentiWorksController extends GetxController {
  RentiWorksRepo rentiWorksRepo;
  RentiWorksController({required this.rentiWorksRepo});

  bool isloading = true;
  RentiWorksModel rentiWorksModel = RentiWorksModel();
  Future<RentiWorksModel> rentiWorks() async {
    ApiResponseModel responseModel = await rentiWorksRepo.howRentiWork();
    // Define the variable here

    if (responseModel.statusCode == 200) {
      rentiWorksModel =
          RentiWorksModel.fromJson(jsonDecode(responseModel.responseJson));
      isloading = false;
      update();
    } else {
      Utils.toastMessage(responseModel.message);

      return RentiWorksModel();
    }

    return rentiWorksModel; // Return the variable here
  }
}
