import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/payment_method/card_details_model/card_details_model.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/payment_method/card_details_repo/card_details_repo.dart';

class CardDetailsController extends GetxController {
  CardDetailsRepo cardDetailsRepo;
  CardDetailsController({required this.cardDetailsRepo});

  bool isLoading = false;
  CardDetailsModel cardDetailsModel = CardDetailsModel();

  Future<CardDetailsModel> cardDetails() async {
    isLoading = true;
    update();

    ApiResponseModel responseModel = await cardDetailsRepo.cardDetails();

    if (responseModel.statusCode == 200) {
      cardDetailsModel = CardDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
      isLoading = false;
      update();
      if (kDebugMode) {
        print("$cardDetailsModel");
      }
    } else {
      isLoading = false;
      update();
      Utils.toastMessage(responseModel.message);
      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return CardDetailsModel(); // Return a default value or handle the error accordingly.
    }
    return cardDetailsModel; // Return the variable here
  }
}