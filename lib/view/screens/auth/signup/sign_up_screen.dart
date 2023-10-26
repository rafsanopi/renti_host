import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  int _radioGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Full name And TextField
                          const CustomText(
                              text: AppStaticStrings.fullName, bottom: 12),
                          CustomTextField(
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
                              text: AppStaticStrings.gender, top: 16),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    fillColor: const MaterialStatePropertyAll(
                                        AppColors.blueNormal),
                                    value: 1,
                                    groupValue: _radioGroupValue,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _radioGroupValue = value!;
                                        },
                                      );
                                    },
                                  ),
                                  const CustomText(
                                    text: AppStaticStrings.male,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    fillColor: const MaterialStatePropertyAll(
                                        AppColors.blueNormal),
                                    value: 2,
                                    groupValue: _radioGroupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _radioGroupValue = value!;
                                      });
                                    },
                                  ),
                                  const CustomText(
                                    text: AppStaticStrings.female,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    fillColor: const MaterialStatePropertyAll(
                                        AppColors.blueNormal),
                                    value: 3,
                                    groupValue: _radioGroupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _radioGroupValue = value!;
                                      });
                                    },
                                  ),
                                  const CustomText(
                                    text: AppStaticStrings.others,
                                  )
                                ],
                              ),
                            ],
                          ),

                          //Date Of Birth
                          const CustomText(
                              text: AppStaticStrings.dateOfBirth,
                              top: 8,
                              bottom: 12),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
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
                              text: AppStaticStrings.password,
                              bottom: 12,
                              top: 16),
                          CustomTextField(
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
                              text: AppStaticStrings.confirmPassword,
                              bottom: 12,
                              top: 16),
                          CustomTextField(
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
                        ],
                      ),
                    ),
                  ),
                )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.signUpContinueScreen);
              },
              titleText: AppStaticStrings.continuee),
        ),
      ),
    );
  }
}
