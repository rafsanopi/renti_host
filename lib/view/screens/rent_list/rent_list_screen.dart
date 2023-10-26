import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_list/inner_widgets/rent_details_top_section.dart';
import 'package:renti_host/view/screens/rent_list/inner_widgets/renti_details_alert.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_controller/rent_list_controller.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_model/rent_list_model.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_repo/rent_list_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';

class RentListScreen extends StatefulWidget {
  const RentListScreen({super.key});

  @override
  State<RentListScreen> createState() => _RentListScreenState();
}

class _RentListScreenState extends State<RentListScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentListRepo(apiService: Get.find()));
    var controller = Get.put(RentListController(rentListRepo: Get.find()));
    controller.rentList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RentListController>(
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: AppColors.whiteLight,
            appBar: const CustomAppBar(
              appBarContent: CustomBack(
                  text: AppStaticStrings.rentList,
                  color: AppColors.blackNormal),
            ),
            body: GetBuilder<RentListController>(
              builder: (controller) {
                RentListModel rentListModel = controller.rentListModel;
                if (controller.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 24, horizontal: 20),
                      child: Column(
                        children: List.generate(
                          rentListModel.rentedCars!.length,
                          (index) => rentListModel.rentedCars![index].requestStatus.toString() != "Completed" &&
                                  rentListModel.rentedCars![index].payment.toString() != "Completed" &&
                                  rentListModel.rentedCars![index].requestStatus.toString() != "Rejected" &&
                                  rentListModel.rentedCars![index].requestStatus.toString() == "Accepted" &&
                              rentListModel.rentedCars![index].carId != null
                              ? GestureDetector(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        RentDetailsAlert(
                                      index: index,
                                      rentListModel: rentListModel,
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsetsDirectional.all(8),
                                    margin: const EdgeInsetsDirectional.only(
                                        bottom: 8),
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
                                    child: RentDetailsTopSection(
                                      image: rentListModel.rentedCars![index]
                                              .userId!.image!.isEmpty
                                          ? AppImages.profileImage
                                          : rentListModel
                                              .rentedCars![index].userId!.image
                                              .toString(),
                                      carName: rentListModel
                                          .rentedCars![index].userId!.fullName
                                          .toString(),
                                      carModel: rentListModel
                                          .rentedCars![index].carId!.year
                                          .toString(),
                                      requestStatus: rentListModel
                                          .rentedCars![index].requestStatus
                                          .toString(),
                                      carLicense: rentListModel
                                          .rentedCars![index]
                                          .carId!
                                          .carLicenseNumber
                                          .toString(),
                                      payment: rentListModel
                                          .rentedCars![index].payment
                                          .toString(),
                                      tripStatus: rentListModel
                                          .rentedCars![index].carId!.tripStatus
                                          .toString(),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
