import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/payment_method/card_details_controller/card_details_controller.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/payment_method/card_details_repo/card_details_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(CardDetailsRepo(apiService: Get.find()));
    var controller = Get.put(CardDetailsController(cardDetailsRepo: Get.find()));
    controller.cardDetails();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
              text: AppStaticStrings.paymentMethod,
              color: AppColors.blackNormal),
        ),
        body: GetBuilder<CardDetailsController>(
          builder: (controller) {
            if (controller.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.cardDetailsModel.card!.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                            children: List.generate(
                              controller.cardDetailsModel.card!.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.cardDetailsScreen,arguments: []);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.whiteNormalActive,
                                            width: 1),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImage(
                                                imageSrc: AppImages.debitCardImage,
                                                size: 40,
                                              ),
                                              CustomText(
                                                text: 'Debit Card',
                                                fontSize: 16,
                                                left: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              size: 16,
                                              color: AppColors.blackNormal),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      )
                      : const SizedBox(),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.addNewCardScreen);
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: AppColors.blueNormal,
                          size: 24,
                        ),
                        CustomText(
                          text: AppStaticStrings.addNew,
                          color: AppColors.blueNormal,
                          fontSize: 18,
                          left: 8,
                          fontWeight: FontWeight.w600,
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
  }
}
