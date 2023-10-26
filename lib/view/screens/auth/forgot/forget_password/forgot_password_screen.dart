import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/data/controller/auth/otp_controller/forgot_pass_repo.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final forgotPassword = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStaticStrings.forgotPassword,
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
                    text: AppStaticStrings.recoverPass,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    bottom: 24,
                  ),
                  //Image
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: AppColors.blueNormal,
                      maxRadius: 50,
                      child: CustomImage(imageSrc: AppIcons.forgotPassIcon),
                    ),
                  ),
                  // Email and TextField
                  const CustomText(
                      text: AppStaticStrings.email, top: 24, bottom: 12),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: CustomTextField(
                      textEditingController:
                          forgotPassword.emailController.value,
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
                forgotPassword
                    .resetPassword(forgotPassword.emailController.value.text);
              },
              titleText: AppStaticStrings.continuee),
        ),
      ),
    );
  }
}
