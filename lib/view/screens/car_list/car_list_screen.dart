import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/%20home/home_controller/home_carlist_controller.dart';
import 'package:renti_host/view/screens/%20home/home_model/home_carlist_model.dart';
import 'package:renti_host/view/screens/car_list/inner_widgets/search_filter.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({super.key});

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCarListController>(builder: (controller) {
      HomeCarListModel homeCarModel = controller.homeCarListModel;

      if (controller.isLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: AppColors.whiteLight,
            appBar: CustomAppBar(
              appBarContent: CustomBack(
                  isBack: false,
                  ontap: () {
                    controller.homeCarList(search: "");

                    // navigator!.pop();
                    navigator!.pop();
                  },
                  text: AppStaticStrings.carList,
                  color: AppColors.blackNormal),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  const SearchFilter(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 24),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeCarModel.cars!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                mainAxisExtent: 170),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.carDetailsScreen,
                                arguments: [homeCarModel, index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteLight,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.zero,
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(homeCarModel
                                            .cars![index].image![0]
                                            .toString()),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 20),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 4),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: homeCarModel
                                                    .cars![index].tripStatus ==
                                                "Start"
                                            ? AppColors.redLight
                                            : AppColors.greenLight,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: homeCarModel
                                                  .cars![index].tripStatus ==
                                              "Start"
                                          ? CustomText(
                                              text: AppStaticStrings.reserved
                                                  .toString(),
                                              color: AppColors.redNormal,
                                              fontSize: 10)
                                          : CustomText(
                                              text: AppStaticStrings.active
                                                  .toString(),
                                              color: AppColors.greenNormal,
                                              fontSize: 10),
                                    ),
                                    CustomText(
                                        text: homeCarModel
                                            .cars![index].carModelName
                                            .toString(),
                                        fontSize: 12),
                                    CustomText(
                                        text: homeCarModel.cars![index].year
                                            .toString(),
                                        fontSize: 10,
                                        color: AppColors.whiteDarkActive),
                                    CustomText(
                                        text: homeCarModel
                                            .cars![index].carLicenseNumber
                                            .toString(),
                                        fontSize: 10,
                                        top: 4,
                                        bottom: 4),
                                    const CustomText(
                                        text: AppStaticStrings.seeDetails,
                                        fontSize: 10,
                                        color: AppColors.blueNormal),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
