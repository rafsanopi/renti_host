import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class EndTripReviewScreen extends StatefulWidget {
  const EndTripReviewScreen({super.key});

  @override
  State<EndTripReviewScreen> createState() => _FilledBoxState();
}

class _FilledBoxState extends State<EndTripReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
              text: AppStaticStrings.review, color: AppColors.blackNormal),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // rating section
                  const CustomText(
                      text: AppStaticStrings.giveUsRating,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      bottom: 16),
                  RatingBarIndicator(
                    unratedColor: AppColors.whiteDark,
                    rating: 4.60,
                    itemBuilder: (context, index) =>
                        const Icon(Icons.star, color: AppColors.ratingColor),
                    itemCount: 5,
                    itemSize: 40.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(height: 16),

                  //Static text Nice Behavior
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      3,
                      (index) {
                        return Column(
                          children: [
                            CustomElevatedButton(
                              onPressed: () {},
                              titleText: AppStaticStrings.niceBehavior,
                              buttonHeight: 42,
                              buttonColor: AppColors.blueLight,
                              titleColor: AppColors.blueNormal,
                              buttonWidth: double.maxFinite,
                              titleSize: 14,
                              titleWeight: FontWeight.w400,
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 8),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteNormalActive,
                          style: BorderStyle.solid,
                          width: 1.0,
                          strokeAlign: 1),
                    ),
                    child: CustomTextField(
                      textInputAction: TextInputAction.done,
                      fieldBorderColor: AppColors.whiteLight,
                      hintText: AppStaticStrings.typeReview,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteNormalActive),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoute.navigation);
              },
              titleText: AppStaticStrings.sendReview,
              buttonHeight: 48,
              titleWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
