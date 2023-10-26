import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  List settingData = [
    "Change Language",
    "Change Password",
    "Payment Method",
    "Privacy Policy"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStaticStrings.settings,
            color: AppColors.blackNormal,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: List.generate(
                settingData.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(AppRoute.changeLanguageScreen);
                      } else if (index == 1) {
                        Get.toNamed(AppRoute.changePasswordScreen);
                      } else if (index == 2) {
                        Get.toNamed(AppRoute.paymentMethodScreen);
                      } else if (index == 3) {
                        Get.toNamed(AppRoute.privacyPolicyScreen);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      width: MediaQuery.of(context).size.width,
                      decoration: ShapeDecoration(
                        color: AppColors.whiteLight,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: AppColors.blueLight),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: settingData[index],
                            fontSize: 16,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppColors.blackNormal,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
