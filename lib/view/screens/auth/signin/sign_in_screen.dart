import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/auth/signin/inner_widget/sign_in_auth.dart';
import 'package:renti_host/view/screens/auth/signin/sign_in_controller/sign_in_controller.dart';
import 'package:renti_host/view/screens/auth/signin/sign_in_repo/sign_in_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SignInRepo(apiService: Get.find()));
    Get.put(SignInController(signInRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (controller) => SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.blueNormal,
            appBar: const CustomAppBar(
              appBarContent: CustomText(
                  text: AppStaticStrings.signIn,
                  fontSize: 18,
                  color: AppColors.whiteLight),
            ),
            body: controller.isSubmit == true
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.whiteLight,
                      color: AppColors.blueNormal,
                    ),
                  )
                : LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) =>
                            CustomContainer(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SignInAuth(),
                            //Don't have an Account? Sign Up Text button
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.signUpScreen);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                child: RichText(
                                  text: TextSpan(
                                    text: AppStaticStrings.haveAnAccount,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.blackNormal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: AppStaticStrings.signUp,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blueNormal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
