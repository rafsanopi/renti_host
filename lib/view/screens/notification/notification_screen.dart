import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStaticStrings.notification,
            color: AppColors.blackNormal,
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.whiteLight,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(right: 16),
                            decoration: const BoxDecoration(
                              color: AppColors.whiteDarkHover,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.credit_card,
                              color: AppColors.whiteLight,
                              size: 18,
                            ),
                          ),
                          const CustomText(
                            text: "You received \$450 today.",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: CustomText(
                        text: "Fri, 12 am",
                        fontSize: 12,
                        color: AppColors.whiteDarkHover,
                        right: 8,
                        top: 8,
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.whiteLight,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AppImages.profileImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                  text: AppStaticStrings.userName,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  bottom: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBarIndicator(
                                    unratedColor: AppColors.whiteDark,
                                    rating: 4.5,
                                    itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: AppColors.ratingColor),
                                    itemCount: 5,
                                    itemSize: 12.0,
                                    direction: Axis.horizontal,
                                  ),
                                  const CustomText(
                                      text: AppStaticStrings.rating,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      left: 8),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.date_range_rounded,
                                      size: 12,
                                      color: AppColors.whiteDarkActive),
                                  CustomText(
                                      text: "06 aug 2023- 07 aug 2023",
                                      color: AppColors.whiteDarkActive,
                                      left: 8)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: CustomText(
                        text: "Fri, 12 am",
                        fontSize: 12,
                        color: AppColors.whiteDarkHover,
                        right: 8,
                        top: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
