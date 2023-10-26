import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/term_condition_screen.dart/tc_controller/tc_controller.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/term_condition_screen.dart/tc_model/tc_model.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/term_condition_screen.dart/tc_repo/tc_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  void initState() {
    //

    //
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(TermConditionRepo(apiService: Get.find()));
    Get.put(TermConditionController(termConditionRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermConditionController>(builder: (controller) {
      return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(
              text: AppStaticStrings.termsConditions,
              color: AppColors.blackNormal,
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                FutureBuilder<TermConditionModel>(
                    future: controller.privacyPolicy(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child:
                                CircularProgressIndicator()); // Show a loading indicator while waiting for data
                      } else if (snapshot.hasError) {
                        return Text(
                            "Error: ${snapshot.error}"); // Show an error message if data fetch fails
                      } else if (!snapshot.hasData) {
                        return const Text(
                            "No data available"); // Handle case where no data is available
                      }
                      TermConditionModel tcModel = snapshot.data!;
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 24),
                        physics: const BouncingScrollPhysics(),
                        child: Html(data: tcModel.termsCondition!.content.toString(),)
                      );
                    }),
          ),
        ),
      );
    });
  }
}
