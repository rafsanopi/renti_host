import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/income/renti_fee_my_payment_model/renti_fee_my_payment_model.dart';
import 'package:renti_host/view/screens/income/renti_fee_my_payment_repo/renti_fee_my_payment_repo.dart';

class RentiFeeMyControllerController extends GetxController {
  RentiFeeMyPaymentRepo rentiFeeMyPaymentRepo;
  RentiFeeMyControllerController({required this.rentiFeeMyPaymentRepo});

  Future<RentiFeeMyPaymentModel> feeOrPayment() async {
    ApiResponseModel responseModel = await rentiFeeMyPaymentRepo.feeOrPayment();
    RentiFeeMyPaymentModel rentiFeeMyPaymentModel; // Define the variable here

    if (responseModel.statusCode == 200) {
      rentiFeeMyPaymentModel = RentiFeeMyPaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      if (kDebugMode) {
        print("$rentiFeeMyPaymentModel");
      }
    } else {
      Utils.toastMessage(responseModel.message);
      // You should handle the case where there's an error. It's also recommended to return an appropriate response in this case.
      return RentiFeeMyPaymentModel(); // Return a default value or handle the error accordingly.
    }
    return rentiFeeMyPaymentModel; // Return the variable here
  }
}