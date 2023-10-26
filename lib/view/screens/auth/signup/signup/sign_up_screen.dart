import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/device_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_repo/sign_up_repo.dart';
import 'package:renti_host/view/screens/auth/signup/signup/inner_section/sign_up_auth_section.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SignUpRepo(apiService: Get.find()));
    Get.put(SignUpController(signUpRepo: Get.find()));

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   controller.initialState();
    // });

    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => SafeArea(
        top: true,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.blueNormal,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(
              text: AppStaticStrings.signUp,
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 24),
                child: SignUpAuthSection(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
