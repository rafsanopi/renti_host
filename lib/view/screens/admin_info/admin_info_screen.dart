import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/admin_info/admin_info_controller/admin_info_controller.dart';
import 'package:renti_host/view/screens/admin_info/admin_info_repo/admin_info_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

import '../../../service/api_service.dart';

class AdminInfoScreen extends StatefulWidget {
  const AdminInfoScreen({super.key});

  @override
  State<AdminInfoScreen> createState() => _AdminInfoScreenState();
}

class _AdminInfoScreenState extends State<AdminInfoScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(AdminInfoRepo(apiService: Get.find()));
    Get.put(AdminInfoController(adminInfoRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminInfoController>(builder: (controller) {
      if (controller.isLoading == true) {
        return const Scaffold(
          body:
          Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(
                text: AppStaticStrings.adminInfo, color: AppColors.blackNormal),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                 SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      text: AppStaticStrings.hotlineNumber,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueNormal,
                      bottom: 8),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.call, color: AppColors.blackNormal, size: 18),
                      CustomText(text: controller.adminInfoModel.adminData![0].phoneNumber.toString(), fontSize: 18, left: 8),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const CustomText(
                      text: AppStaticStrings.email,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueNormal,
                      bottom: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.email_outlined,
                          color: AppColors.blackNormal, size: 18),
                      CustomText(text: controller.adminInfoModel.adminData![0].email.toString(), fontSize: 18, left: 8),
                    ],
                  ),
                  const SizedBox(height: 24),


                  const CustomText(
                      text: AppStaticStrings.officeAddress,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueNormal,
                      bottom: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on_outlined,
                          color: AppColors.blackNormal, size: 18),
                      CustomText(
                          text: controller.adminInfoModel.adminData![0].address.toString(),
                          fontSize: 18,
                          left: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
