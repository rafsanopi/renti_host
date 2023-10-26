import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class SignUpAuthSection extends StatefulWidget {
  const SignUpAuthSection({super.key});

  @override
  State<SignUpAuthSection> createState() => _SignUpAuthSectionState();
}

class _SignUpAuthSectionState extends State<SignUpAuthSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Full name And TextField
            const CustomText(text: AppStaticStrings.fullName, bottom: 12),
            CustomTextField(
              textEditingController: controller.fullNameController,
              hintText: AppStaticStrings.enterFullName,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteNormalActive),
            ),

            //Email and TextField
            const CustomText(
              text: AppStaticStrings.email,
              top: 16,
              bottom: 12,
            ),
            CustomTextField(
              textEditingController: controller.emailController,
              textInputAction: TextInputAction.done,
              hintText: AppStaticStrings.enterEmail,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStaticStrings.notBeEmpty;
                } else if (!value.contains(RegExp('@'))) {
                  return AppStaticStrings.enterValidEmail;
                } else {
                  return null;
                }
              },
            ),

            //Gender Selection
            const CustomText(
                text: AppStaticStrings.gender, top: 16, bottom: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                controller.genderList.length,
                (index) => GestureDetector(
                  onTap: () => controller.changeGender(index),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsetsDirectional.all(0.5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors.blackNormal.withOpacity(0.2),
                            ),
                            shape: BoxShape.circle),
                        child: Container(
                          decoration: BoxDecoration(
                              color: index == controller.selectedGender
                                  ? AppColors.blueDark
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                        ),
                      ),
                      CustomText(text: controller.genderList[index], left: 8),
                    ],
                  ),
                ),
              ),
            ),

            //Date Of Birth
            const CustomText(
                text: AppStaticStrings.dateOfBirth, top: 16, bottom: 12),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    keyboardType: TextInputType.datetime,
                    textEditingController: controller.dateController,
                    hintText: AppStaticStrings.dd,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    keyboardType: TextInputType.datetime,
                    textEditingController: controller.monthController,
                    hintText: AppStaticStrings.mm,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    keyboardType: TextInputType.datetime,
                    textEditingController: controller.yearController,
                    hintText: AppStaticStrings.yy,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteNormalActive,
                    ),
                  ),
                ),
              ],
            ),

            //Password Text and TextField
            const CustomText(
                text: AppStaticStrings.password, bottom: 12, top: 16),
            CustomTextField(
              textEditingController: controller.passwordController,
              isPassword: true,
              isPrefixIcon: true,
              hintText: AppStaticStrings.enterPassword,
              keyboardType: TextInputType.visiblePassword,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStaticStrings.notBeEmpty;
                } else if (value.length < 6) {
                  return AppStaticStrings.passwordShouldBe;
                } else {
                  return null;
                }
              },
            ),

            //Confirm Password Text and TextField
            const CustomText(
                text: AppStaticStrings.confirmPassword, bottom: 12, top: 16),
            CustomTextField(
              textEditingController: controller.confirmPasswordController,
              isPassword: true,
              textInputAction: TextInputAction.done,
              isPrefixIcon: true,
              hintText: AppStaticStrings.confirmPassword,
              keyboardType: TextInputType.visiblePassword,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStaticStrings.notBeEmpty;
                } else if (value.length < 6) {
                  return AppStaticStrings.passwordShouldBe;
                } else {
                  return null;
                }
              },
            ),

            const SizedBox(height: 24),

            CustomElevatedButton(
                onPressed: () {
                  if (controller.passwordController.text !=
                      controller.confirmPasswordController.text) {
                    Utils.toastMessageCenter("Password Doesn't Match");
                  } else if (controller.fullNameController.text.isEmpty ||
                      controller.emailController.text.isEmpty ||
                      controller.genderList.isEmpty) {
                    Utils.toastMessageCenter("Input Field Can't be Empty");
                  } else if (controller.passwordController.text.isEmpty ||
                      controller.emailController.text.isEmpty) {
                    Utils.toastMessageCenter("Input Field Can't Be Empty");
                  } else {
                    setDataToLocalStore(controller,
                        fullName: controller.fullNameController.text,
                        email: controller.emailController.text,
                        gender: controller.genderList[controller.selectedGender]
                            .toString(),
                        dob:
                            "${controller.dateController.text}/${controller.monthController.text}/${controller.yearController.text}",
                        password: controller.confirmPasswordController.text);
                  }
                },
                titleText: AppStaticStrings.continuee,
                buttonWidth: double.maxFinite,
                buttonHeight: 48)
          ],
        ),
      ),
    );
  }

  setDataToLocalStore(SignUpController signUpController,
      {required String fullName,
      required String email,
      required String gender,
      required String dob,
      required String password}) async {
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.fullName, fullName);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.email, email);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.gender, gender);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.dob, dob);
    await signUpController.signUpRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.password, password);

    Get.toNamed(AppRoute.signUpContinueScreen);
  }
}
