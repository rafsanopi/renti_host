import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class WeeklyIncomeScreen extends StatelessWidget {
  const WeeklyIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStaticStrings.weeklyIncome,
            color: AppColors.blackNormal,
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                children: List.generate(5,
                  (index) {
                    return Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: AppColors.whiteLight,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(AppImages.blueCar),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'Toyota Harrier',
                                  color: AppColors.blueNormal,
                                  fontWeight: FontWeight.w700,
                                  bottom: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Transition ID
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: AppStaticStrings.transitionNo,
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.whiteDarkHover,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "1234567898",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackNormal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const CustomText(
                                      text: '\$ 50',
                                      textAlign: TextAlign.right,
                                      color: AppColors.blueNormal,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                //Date Of review section
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppStaticStrings.tripNo,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.whiteDarkHover),
                                      ),
                                      TextSpan(
                                        text: "10",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackNormal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
