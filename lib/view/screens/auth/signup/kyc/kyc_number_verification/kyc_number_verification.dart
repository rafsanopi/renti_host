import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/data/controller/auth/otp_controller/forgot_pass_repo.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_number_verification/kyc_email_veri_repo/kyc_email_veri_repo.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_number_verification/resend_otp_repo/resend_otp_repo.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class KYCNumberVerification extends StatefulWidget {
  const KYCNumberVerification({super.key});

  @override
  State<KYCNumberVerification> createState() => _KYCNumberVerificationState();
}

class _KYCNumberVerificationState extends State<KYCNumberVerification> {
  final forgotPassword = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(text: AppStaticStrings.mobileVerification),
        ),
        body: GetBuilder<SignUpController>(builder: (controller) {
          return LayoutBuilder(
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
                      text: AppStaticStrings.weHaveSent,
                      fontSize: 16,
                      textAlign: TextAlign.start,
                      bottom: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(25),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF000B90),
                        ),
                        child: const CustomImage(imageSrc: AppIcons.otpIcon),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PinCodeTextField(
                      length: 4,
                      obscureText: false,
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
                          fieldWidth: 44,
                          activeColor: AppColors.whiteNormalActive,
                          inactiveColor: AppColors.whiteNormalActive,
                          activeFillColor: AppColors.whiteNormalActive,
                          inactiveFillColor: AppColors.whiteNormalActive,
                          selectedFillColor: AppColors.whiteNormalActive,
                          selectedColor: AppColors.whiteNormalActive),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: false,
                      onCompleted: (v) {
                        VerifyEmailRepo(apiService: Get.find()).verifyEmail(
                            otp: v.toString(),
                            email: controller.emailController.text);
                      },
                      // onChanged: (value) {},
                      // beforeTextPaste: (text) {
                      //   return true;
                      // },
                      appContext: context,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomText(text: AppStaticStrings.notGetOTP),
                        GestureDetector(
                          onTap: () {
                            ResentOtp.resendOtp(
                                email: controller.emailController.text);
                          },
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
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.kycEmailVerification);
              },
              titleText: AppStaticStrings.verify),
        ),
      ),
    );
  }
}
