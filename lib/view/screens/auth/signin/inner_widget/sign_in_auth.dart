import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/auth/signin/sign_in_controller/sign_in_controller.dart';
import 'package:renti_host/view/widgets/button/custom_button_with_icon.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class SignInAuth extends StatefulWidget {
  const SignInAuth({super.key});

  @override
  State<SignInAuth> createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Email pass auth section
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Email Text and TextField.
              const CustomText(text: AppStaticStrings.email, bottom: 12),
              CustomTextField(
                textEditingController: controller.emailController,
                focusNode: controller.emailFocusNode,
                hintText: AppStaticStrings.enterEmail,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: AppColors.whiteNormalActive,
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, controller.emailFocusNode, controller.passwordFocusNode);
                },
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

              //Password Text and TextField.
              const CustomText(
                text: AppStaticStrings.password,
                bottom: 12,
                top: 16,
              ),
              CustomTextField(
                textEditingController: controller.passwordController,
                focusNode: controller.passwordFocusNode,
                isPassword: true,
                textInputAction: TextInputAction.done,
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

              //Forget Password Button
              GestureDetector(
                onTap: () {
                  controller.clearData();
                  Get.toNamed(AppRoute.forgotPasswordScreen);
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: CustomText(
                    text: AppStaticStrings.forgotPass,
                    fontSize: 16,
                    color: AppColors.blueDark,
                    bottom: 24,
                    top: 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        //Sign In button
        CustomElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              controller.signInUser();
            }
          },
          titleText: AppStaticStrings.signIn,
          buttonWidth: double.maxFinite,
        ),

        //Or Text
        const Align(
          alignment: Alignment.center,
          child: CustomText(
            text: AppStaticStrings.or,
            top: 24,
            bottom: 24,
            fontSize: 16,
          ),
        ),
        //SIgn In with Google and apple
        Row(
          children: [
            Expanded(
              child: CustomElevatedButtonWithIcon(
                onPressed: () {},
                titleText: AppStaticStrings.google,
                iconSrc: AppIcons.googleIcon,
                imageType: ImageType.png,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomElevatedButtonWithIcon(
                onPressed: () {},
                titleText: AppStaticStrings.apple,
                iconSrc: AppIcons.appleIcon,
                imageType: ImageType.png,
              ),
            ),
          ],
        ),
      ],
    )
    );
  }
}