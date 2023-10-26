import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/data/controller/settings/change_password_controller/change_password_controller.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(ChangePasswordController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
              text: AppStaticStrings.changePassword,
              color: AppColors.blackNormal),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: AppStaticStrings.currentPassword,
                        bottom: 12,
                      ),
                      CustomTextField(
                        textEditingController: controller.currentPassword.value,
                        textInputAction: TextInputAction.done,
                        hintText: AppStaticStrings.enterCurrentPassword,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            color: AppColors.whiteNormalActive),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStaticStrings.notBeEmpty;
                          } else {
                            return null;
                          }
                        },
                      ),
                      const CustomText(
                        text: AppStaticStrings.newPassword,
                        top: 16,
                        bottom: 12,
                      ),
                      CustomTextField(
                        textEditingController: controller.newPassword.value,
                        textInputAction: TextInputAction.done,
                        hintText: AppStaticStrings.enterNewPassword,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            color: AppColors.whiteNormalActive),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStaticStrings.notBeEmpty;
                          } else {
                            return null;
                          }
                        },
                      ),
                      const CustomText(
                        text: AppStaticStrings.confirmPassword,
                        top: 16,
                        bottom: 12,
                      ),
                      CustomTextField(
                        textEditingController: controller.reTypedPassword.value,
                        textInputAction: TextInputAction.done,
                        hintText: AppStaticStrings.enterConfirmPassword,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            color: AppColors.whiteNormalActive),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStaticStrings.notBeEmpty;
                          } else {
                            return null;
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CustomText(
                          text: AppStaticStrings.forgotPass,
                          color: AppColors.blueNormal,
                          fontSize: 16,top: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: CustomElevatedButton(onPressed: (){
            controller.changePass(controller.currentPassword.value.text, controller.currentPassword.value.text, controller.reTypedPassword.value.text);
          }, titleText: AppStaticStrings.save),
        ),
      ),
    );
  }
}
