import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/helper/date_converter_helper.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/review/inner_widgets/all_review_top_section.dart';
import 'package:renti_host/view/screens/review/review_controller/review_controller.dart';
import 'package:renti_host/view/screens/review/review_model/review_model.dart';
import 'package:renti_host/view/screens/review/review_repo/review_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class AllReviewScreen extends StatefulWidget {
  const AllReviewScreen({super.key});

  @override
  State<AllReviewScreen> createState() => _AllReviewScreenState();
}

class _AllReviewScreenState extends State<AllReviewScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ReviewRepo(apiService: Get.find()));
    Get.put(ReviewController(reviewRepo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
              text: AppStaticStrings.allReviews, color: AppColors.blackNormal),
        ),
        body: GetBuilder<ReviewController>(builder: (controller) {
          if (controller.isloading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          ReviewModel reviewModel = controller.reviewModel;
          return SingleChildScrollView(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 24, horizontal: 20),
            child: reviewModel.review!.isNotEmpty
                ? Column(
                    children: List.generate(
                      reviewModel.review!.length,
                      (index) => reviewModel.review![index].carId == null
                          ? const SizedBox()
                          : Container(
                              padding: const EdgeInsetsDirectional.all(16),
                              margin:
                                  const EdgeInsetsDirectional.only(bottom: 8),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColors.whiteLight,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AllReviewTopSection(
                                    userName: reviewModel
                                        .review![index].userId!.fullName
                                        .toString(),
                                    ratting: reviewModel.review![index].rating
                                        .toString(),
                                    carLicense: reviewModel
                                        .review![index].carId!.carLicenseNumber
                                        .toString(),
                                    userImg: reviewModel
                                        .review![index].userId!.image
                                        .toString(),
                                    carImg: reviewModel
                                        .review![index].carId!.image![0]
                                        .toString(),
                                    date: DateConverter
                                        .formatDepositTimeWithAmFormat(
                                            reviewModel
                                                .review![index].carId!.createdAt
                                                .toString()),
                                  ),
                                  const SizedBox(height: 16),
                                  CustomText(
                                    textAlign: TextAlign.start,
                                    text: reviewModel.review![index].comment
                                        .toString(),
                                    color: AppColors.whiteDarkActive,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  )
                : const SizedBox(),
          );
        }),
      ),
    );
  }
}
