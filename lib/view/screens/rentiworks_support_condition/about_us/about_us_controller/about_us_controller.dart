import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/about_us/about_us_model/about_us_model.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';

class AboutUsController extends GetxController {
  AboutUsRepo aboutUsRepo;
  AboutUsController({required this.aboutUsRepo});





  Future<AboutUsModel> aboutUs() async {
    ApiResponseModel responseModel = await aboutUsRepo.aboutUS();
    AboutUsModel aboutUsModel; // Define the variable here

    if (responseModel.statusCode == 200) {
      aboutUsModel =
          AboutUsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      Utils.toastMessage(responseModel.message);
      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return AboutUsModel(); // Return a default value or handle the error accordingly.
    }

    return aboutUsModel; // Return the variable here
  }
}
