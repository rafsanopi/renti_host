import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/home/home_model/home_carlist_model.dart';
import 'package:renti_host/view/screens/add_cars/add_car_screen/inner_widgets/car_image_scetion.dart';
import 'package:renti_host/view/screens/car_details/inner_widgets/document_file_section.dart';
import 'package:renti_host/view/screens/car_details/inner_widgets/popup_menu.dart';
import 'package:renti_host/view/screens/car_details/inner_widgets/reserved_details.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  HomeCarListModel homeCarListModel = Get.arguments[0];
  int index = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: CustomAppBar(
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomBack(
                  text: AppStaticStrings.carDetails,
                  color: AppColors.blackNormal),
              if (homeCarListModel.cars![index].tripStatus != "Start")
                PopUpMenu(
                  homeCarListModel: homeCarListModel,
                  index: index,
                )
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarImageSection(homeCarListModel: homeCarListModel, index: index),
              const SizedBox(height: 16),
              //Car Name And Status Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text:
                          homeCarListModel.cars![index].carModelName.toString(),
                      fontSize: 18,
                      color: AppColors.blueNormal,
                      fontWeight: FontWeight.w500),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: homeCarListModel.cars![index].tripStatus == "Start"
                          ? AppColors.redLight
                          : AppColors.greenLight,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CustomText(
                        text:
                            homeCarListModel.cars![index].tripStatus == "Start"
                                ? AppStaticStrings.reserved
                                : AppStaticStrings.active,
                        color:
                            homeCarListModel.cars![index].tripStatus == "Start"
                                ? AppColors.redNormal
                                : AppColors.greenNormal,
                        fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              //Cost Per Day
              CustomText(
                  text:
                      "\$${homeCarListModel.cars![index].hourlyRate.toString()}/day",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              const SizedBox(height: 24),
              ReservedDetails(homeCarListModel: homeCarListModel, index: index),
              const SizedBox(height: 16),
              DocumentFilesSection(
                  documentsName: homeCarListModel.cars![index].kyc),
            ],
          ),
        ),
      ),
    );
  }
}
