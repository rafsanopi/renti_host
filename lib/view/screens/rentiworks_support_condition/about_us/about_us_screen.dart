import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/about_us/about_us_controller/about_us_controller.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/about_us/about_us_model/about_us_model.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    //

    //
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(AboutUsRepo(apiService: Get.find()));
    Get.put(AboutUsController(aboutUsRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (controller) {
      return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(
              text: AppStaticStrings.aboutUs,
              color: AppColors.blackNormal,
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                FutureBuilder<AboutUsModel>(
                    future: controller.aboutUs(),
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
                      AboutUsModel tcModel = snapshot.data!;
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 24),
                        physics: const BouncingScrollPhysics(),
                        child: Html(data: tcModel.about!.content.toString(),)
                      );
                    }),
          ),
        ),
      );
    });
  }
}
