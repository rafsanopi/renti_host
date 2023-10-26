import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/income/my_payment/inner_widgets/pyment_details_card.dart';
import 'package:renti_host/view/screens/income/renti_fee_my_payment_controller/renti_fee_my_payment_controller.dart';
import 'package:renti_host/view/screens/income/renti_fee_my_payment_repo/renti_fee_my_payment_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentiFeeMyPaymentRepo(apiService: Get.find()));
    var controller = Get.put(
        RentiFeeMyControllerController(rentiFeeMyPaymentRepo: Get.find()));
    controller.feeOrPayment();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentiFeeMyControllerController>(
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: AppColors.whiteLight,
            appBar: const CustomAppBar(
              appBarContent: CustomBack(
                text: AppStaticStrings.myPayment,
                color: AppColors.blackNormal,
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraint) {
                return const SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  physics: BouncingScrollPhysics(),
                  child: PaymentDetailsCard(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
