import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class KYCEmailVerification extends StatefulWidget {
  const KYCEmailVerification({super.key});

  @override
  State<KYCEmailVerification> createState() => _KYCEmailVerificationState();
}

class _KYCEmailVerificationState extends State<KYCEmailVerification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(text: AppStaticStrings.emailVerification),
        ),
        body: GetBuilder<SignUpController>(builder: (controller) {
          if (controller.isloading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
                      text: AppStaticStrings.weSentEmail,
                      fontSize: 16,
                      textAlign: TextAlign.start,
                      bottom: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.blueNormal,
                        ),
                        child: const CustomImage(
                          imageSrc: AppIcons.forgotPassIcon,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomText(text: AppStaticStrings.getTheEmail),
                        GestureDetector(
                          onTap: () {},
                          child: const CustomText(
                            text: AppStaticStrings.resendEmail,
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
      ),
    );
  }
}
