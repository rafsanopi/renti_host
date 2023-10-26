import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/screens/income/my_payment/payment_screen.dart';
import 'package:renti_host/view/screens/income/renti_free/renti_free_Screen.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class IncomeCategory extends StatelessWidget {
  IncomeCategory({super.key});

  final List incomeList = ["Weekly Income", "Renti Fee", "My Payment"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        incomeList.length,
        (index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Get.toNamed(AppRoute.weeklyIncomeScreen);
              } else if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RentFeeScreen()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PaymentScreen()));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: AppColors.blueLight,
                    style: BorderStyle.solid,
                    width: 1.0),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: incomeList[index],
                        fontSize: 18,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        weight: 18,
                        size: 18,
                        color: AppColors.blueNormal,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
