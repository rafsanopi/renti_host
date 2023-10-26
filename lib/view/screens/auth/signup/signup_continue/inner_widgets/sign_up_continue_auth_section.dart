import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class SignUpContinueAuthSection extends StatefulWidget {
  const SignUpContinueAuthSection({super.key});

  @override
  State<SignUpContinueAuthSection> createState() =>
      _SignUpContinueAuthSectionState();
}

class _SignUpContinueAuthSectionState extends State<SignUpContinueAuthSection> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: AppStaticStrings.phoneNumber, bottom: 12),
            //Country Flag and Enter Phone Number TextField
            SizedBox(
              height: 56,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteDark,
                          width: 1.0,
                          style: BorderStyle.solid),
                    ),
                    child: const Row(
                      children: [
                        CustomImage(imageSrc: AppImages.flagImage, size: 40),
                        CustomText(
                            text: AppStaticStrings.phone,
                            left: 10,
                            color: AppColors.whiteNormalActive)
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      textEditingController: controller.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      hintText: AppStaticStrings.enterPhoneNumber,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteNormalActive),
                    ),
                  ),
                ],
              ),
            ),

            //Address Text and TextField
            const CustomText(
                text: AppStaticStrings.address, top: 16, bottom: 12),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.whiteLight,
                  border: Border.all(
                      color: AppColors.whiteNormalActive,
                      style: BorderStyle.solid,
                      width: 1.0,
                      strokeAlign: 1)),
              child: CustomTextField(
                textEditingController: controller.addressController,
                textInputAction: TextInputAction.done,
                fieldBorderColor: AppColors.whiteLight,
                hintText: AppStaticStrings.enterAddress,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteNormalActive),
              ),
            ),

            const SizedBox(height: 40),

            CustomElevatedButton(
                onPressed: () {
                  if (controller.phoneNumberController.text.isNotEmpty &&
                      controller.addressController.text.isNotEmpty) {
                    setDataToLocalStore(controller,
                        phoneNumber:
                            "${controller.phoneCode} ${controller.phoneNumberController.text}",
                        address: controller.addressController.text);
                  } else {
                    Utils.toastMessage("InputField Can't be Empty");
                  }
                },
                buttonHeight: 48,
                buttonWidth: double.maxFinite,
                titleText: AppStaticStrings.continuee),
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController,
      {required String phoneNumber, required String address}) async {
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.phoneNumber, phoneNumber);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.address, address);

    if (kDebugMode) {
      print("phone number: $phoneNumber\n");
    }
    if (kDebugMode) {
      print("address: $address\n");
    }

    Get.toNamed(AppRoute.kycScreen);
  }
}
