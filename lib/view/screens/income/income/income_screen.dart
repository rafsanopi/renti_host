import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/income/income/income_controller/income_controller.dart';
import 'package:renti_host/view/screens/income/income/income_repo/income_repo.dart';
import 'package:renti_host/view/screens/income/income/inner_widgets/income_category.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(IncomeRepo(apiService: Get.find()));
    var controller = Get.put(IncomeController(incomeRepo: Get.find()));
    controller.totalIncome();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncomeController>(
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: AppColors.whiteLight,
            appBar: const CustomAppBar(
              appBarContent: CustomBack(
                  text: AppStaticStrings.income, color: AppColors.blackNormal),
            ),
            body: LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppColors.blueNormal,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 10,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AppStaticStrings.totalIncome,
                              color: AppColors.whiteLight,
                              fontSize: 18,
                              bottom: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: '\$ 1,20,000.00',
                              color: AppColors.whiteLight,
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      IncomeCategory(),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
