import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:renti_host/data/controller/auth/forget_password_controller/forgot_pass_otp_repo.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class ForgotPassOTP extends StatefulWidget {
  const ForgotPassOTP({super.key});

  @override
  State<ForgotPassOTP> createState() => _ForgotPassOTPState();
}

class _ForgotPassOTPState extends State<ForgotPassOTP> {
  final otpController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStaticStrings.otp,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: AppStaticStrings.otpCode,
                    fontSize: 16,
                    bottom: 24,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: AppColors.blueNormal,
                      maxRadius: 50,
                      child: CustomImage(imageSrc: AppIcons.otpIcon),
                    ),
                  ),
                  const SizedBox(height: 40),
                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    controller: otpController.controllerOTP.value,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackNormal),
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        disabledColor: Colors.blue,
                        fieldHeight: 56,
                        fieldWidth: 50,
                        activeColor: AppColors.whiteNormalActive,
                        inactiveColor: AppColors.whiteNormalActive,
                        activeFillColor: AppColors.whiteNormalActive,
                        inactiveFillColor: AppColors.whiteNormalActive,
                        selectedFillColor: AppColors.whiteNormalActive,
                        selectedColor: AppColors.whiteNormalActive),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: false,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomText(text: AppStaticStrings.notGetOTP),
                      GestureDetector(
                        onTap: () {},
                        child: const CustomText(
                          text: AppStaticStrings.resendOTP,
                          color: AppColors.blueNormal,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
            onPressed: () {
              otpController.verifyOTP(otpController.controllerOTP.value.text, otpController.forgetPassController.emailController.value.text);
            },
            titleText: AppStaticStrings.verify,
          ),
        ),
      ),
    );
  }
}
