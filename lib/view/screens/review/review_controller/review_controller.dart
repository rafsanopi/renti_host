import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/review/review_model/review_model.dart';
import 'package:renti_host/view/screens/review/review_repo/review_repo.dart';

class ReviewController extends GetxController {
  ReviewRepo reviewRepo;
  ReviewController({required this.reviewRepo});

  @override
  void onInit() {
    review();
    super.onInit();
  }

  // String userName = "";
  // String carLicense = "";
  // String date = "";
  // String userImg = "";

  // String carImg = "";
  // String ratting = "";

  ReviewModel reviewModel = ReviewModel();
  bool isloading = true;
  Future<void> review() async {
    ApiResponseModel responseModel = await reviewRepo.reviewRepo();

    if (responseModel.statusCode == 200) {
      reviewModel =
          ReviewModel.fromJson(jsonDecode(responseModel.responseJson));

      isloading = false;
      update();
    } else {
      Utils.toastMessage(responseModel.message);
    }
  }
}
