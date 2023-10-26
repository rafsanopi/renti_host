import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/income/renti_fee_my_payment_controller/renti_fee_my_payment_controller.dart';
import 'package:renti_host/view/screens/income/renti_fee_my_payment_repo/renti_fee_my_payment_repo.dart';
import 'package:renti_host/view/screens/income/renti_free/inner_widget/rent_fee_card.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';


class RentFeeScreen extends StatefulWidget {
  const RentFeeScreen({super.key});

  @override
  State<RentFeeScreen> createState() => _RentFeeScreenState();
}

class _RentFeeScreenState extends State<RentFeeScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentiFeeMyPaymentRepo(apiService: Get.find()));
    var controller = Get.put(RentiFeeMyControllerController(rentiFeeMyPaymentRepo: Get.find()));
    controller.feeOrPayment();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentiFeeMyControllerController>(builder: (controller) {
      return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(
              text: AppStaticStrings.rentiFee,
              color: AppColors.blackNormal,
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return const SingleChildScrollView(
                padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                child: RentFeeCard(),
              );
            },
          ),
        ),
      );
    },);
  }
}
