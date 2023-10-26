import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class KYCAuthSection extends StatefulWidget {
  const KYCAuthSection({super.key});

  @override
  State<KYCAuthSection> createState() => _KYCAuthSectionState();
}

class _KYCAuthSectionState extends State<KYCAuthSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Upload INE or Passport Text and File..
          const CustomText(
            text: AppStaticStrings.nOTEAllfilemust,
            color: AppColors.whiteDarkActive,
            fontWeight: FontWeight.bold,
            top: 16,
            bottom: 8,
            textAlign: TextAlign.start,
          ),
          const CustomText(
            text: AppStaticStrings.uploadINE,
            color: AppColors.whiteDarkActive,
            top: 16,
            bottom: 8,
            textAlign: TextAlign.start,
          ),

          controller.uploadINEOrPassport == null
              ? GestureDetector(
                  onTap: () => controller.pickIneOrPassportFile(),
                  child: Container(
                    height: 115,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            width: 1, color: AppColors.whiteNormalActive),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: const CustomImage(imageSrc: AppIcons.uploadIcons),
                  ),
                )
              : Container(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColors.whiteNormalActive),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.redNormal,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child:
                                const CustomImage(imageSrc: AppIcons.pdfIcon),
                          ),
                          const SizedBox(width: 12),
                          CustomText(
                            text: controller.ineOrPassportFileName,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => controller.removeIneOrPassportFile(),
                        child: const Icon(Icons.cancel_outlined,
                            color: AppColors.redNormal, size: 24),
                      )
                    ],
                  ),
                ),

          //Upload Text Stamps Key Extension Text and File..
          const CustomText(
            text: AppStaticStrings.uploadTax,
            color: AppColors.whiteDarkActive,
            top: 16,
            bottom: 8,
            textAlign: TextAlign.start,
          ),

          controller.uploadTaxStampsKey == null
              ? GestureDetector(
                  onTap: () => controller.pickTaxStampsFile(),
                  child: Container(
                    height: 115,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            width: 1, color: AppColors.whiteNormalActive),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: const CustomImage(imageSrc: AppIcons.uploadIcons),
                  ),
                )
              : Container(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColors.whiteNormalActive),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.redNormal,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child:
                                const CustomImage(imageSrc: AppIcons.pdfIcon),
                          ),
                          const SizedBox(width: 12),
                          CustomText(
                            text: controller.taxStampKeyFileName,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => controller.removeTaxStampsFile(),
                        child: const Icon(Icons.cancel_outlined,
                            color: AppColors.redNormal, size: 24),
                      )
                    ],
                  ),
                ),

          //Upload Text Stamps Key Extension Text and File..
          const CustomText(
            text: AppStaticStrings.uploadCer,
            color: AppColors.whiteDarkActive,
            top: 16,
            textAlign: TextAlign.start,
          ),

          controller.uploadCerStampsKey == null
              ? GestureDetector(
                  onTap: () => controller.pickTaxCerFile(),
                  child: Container(
                    height: 115,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            width: 1, color: AppColors.whiteNormalActive),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: const CustomImage(imageSrc: AppIcons.uploadIcons),
                  ),
                )
              : Container(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColors.whiteNormalActive),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.redNormal,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child:
                                const CustomImage(imageSrc: AppIcons.pdfIcon),
                          ),
                          const SizedBox(width: 12),
                          CustomText(
                            text: controller.cerStampKeyFileName,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => controller.removeTaxCerStampsFile(),
                        child: const Icon(Icons.cancel_outlined,
                            color: AppColors.redNormal, size: 24),
                      )
                    ],
                  ),
                ),

          //INE/Passport Text and TextField
          const CustomText(
            text: AppStaticStrings.ineOrPassport,
            top: 16,
            bottom: 12,
            textAlign: TextAlign.start,
          ),
          CustomTextField(
            textEditingController: controller.ineNumberController,
            textInputAction: TextInputAction.done,
            hintText: AppStaticStrings.enterIneOrPassword,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),

          //RFC Text and TextField
          const CustomText(
            text: AppStaticStrings.rfc,
            top: 16,
            bottom: 12,
            textAlign: TextAlign.start,
          ),
          CustomTextField(
            textEditingController: controller.rfcController,
            textInputAction: TextInputAction.done,
            hintText: AppStaticStrings.enterRFC,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteNormalActive),
          ),
          const SizedBox(height: 24),
          CustomElevatedButton(
              onPressed: () {
                if (controller.ineNumberController.text.isNotEmpty &&
                    controller.rfcController.text.isNotEmpty) {
                  setDataToLocalStore(
                      controller,
                      controller.ineOrPassportFileName,
                      controller.taxStampKeyFileName,
                      controller.cerStampKeyFileName,
                      controller.ineNumberController.text,
                      controller.rfcController.text);
                } else {
                  Utils.toastMessageCenter("Input Field Can't Be Empty");
                }
              },
              buttonWidth: double.maxFinite,
              buttonHeight: 48,
              titleText: AppStaticStrings.continuee)
        ],
      ),
    );
  }

  setDataToLocalStore(
      SignUpController controller,
      String ineOrPassportFileName,
      String taxStampKeyFileName,
      String cerStampKeyFileName,
      String ineNumber,
      String rfc) async {
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.ineOrPassport, ineOrPassportFileName);
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.taxStampsKey, taxStampKeyFileName);
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.taxStampsCer, cerStampKeyFileName);
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.ineNumber, ineNumber);
    await controller.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.rfc, rfc);

    if (kDebugMode) {
      print(ineNumber);
    }
    if (kDebugMode) {
      print(rfc);
    }
    Get.toNamed(AppRoute.kycImageScreen);
  }
}
