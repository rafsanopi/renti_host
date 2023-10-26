import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/device_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/screens/auth/signup/signup_continue/inner_widgets/sign_up_continue_auth_section.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';

class SignUpContinueScreen extends StatefulWidget {
  const SignUpContinueScreen({super.key});

  @override
  State<SignUpContinueScreen> createState() => _SignUpContinueScreenState();
}

class _SignUpContinueScreenState extends State<SignUpContinueScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
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
            appBarContent: CustomBack(text: AppStaticStrings.signUp),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SignUpContinueAuthSection(),
              ),
            ),
          ),
        ),
      ),
    );
  }
  setDataToLocalStore(SignUpController signUpController, {required String phoneNumber, required String address}) async{

    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.phoneNumber, phoneNumber);
    await signUpController.signUpRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.address, address);

    if (kDebugMode) {
      print("phone number: $phoneNumber");
    }
    if (kDebugMode) {
      print("address: $address");
    }

    Get.toNamed(AppRoute.kycScreen);
  }
}
