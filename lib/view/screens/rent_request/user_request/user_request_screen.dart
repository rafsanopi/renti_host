import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_request/user_request/inner_widgets/user_request_card.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_controller/rent_request_controller.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_repo/rent_request_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class UserRequestScreen extends StatefulWidget {
  const UserRequestScreen({super.key});

  @override
  State<UserRequestScreen> createState() => _UserRequestScreenState();
}

class _UserRequestScreenState extends State<UserRequestScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentRequestRepo(apiService: Get.find()));
    var controller =
        Get.put(RentRequestController(rentRequestRepo: Get.find()));
    controller.rentRequest();
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
          appBarContent: CustomText(
              text: AppStaticStrings.usersRequest,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        body: GetBuilder<RentRequestController>(
          builder: (controller) {
            if (controller.isloading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    children: List.generate(
                      controller.rentRequestResponseModel.rentRequest!.length,
                      (index) {
                        String startDateString = controller
                            .rentRequestResponseModel
                            .rentRequest![index]
                            .startDate
                            .toString();

                        String endDateString = controller
                            .rentRequestResponseModel
                            .rentRequest![index]
                            .endDate
                            .toString();

                        // Define a regular expression pattern to match the date part
                        RegExp datePattern = RegExp(r"(\d{4}-\d{2}-\d{2})");

                        // Use the regular expression to extract the date part
                        String formattedStartDate =
                            datePattern.firstMatch(startDateString)?.group(0) ??
                                '';
                        String formattedEndDate =
                            datePattern.firstMatch(endDateString)?.group(0) ??
                                '';

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.userRequestDetails,
                                arguments: [
                                  controller.rentRequestResponseModel,
                                  index,
                                ]);
                          },
                          child: controller.rentRequestResponseModel
                                          .rentRequest![index].requestStatus ==
                                      "Pending" &&
                                  controller.rentRequestResponseModel
                                          .rentRequest![index].carId !=
                                      null &&
                                  controller.rentRequestResponseModel
                                          .rentRequest![index].sentRequest !=
                                      "Cancel"
                              ? Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsetsDirectional.only(
                                      bottom: 24),
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
                                  child: UserRequestCard(
                                    id: controller.rentRequestResponseModel
                                        .rentRequest![index].id
                                        .toString(),
                                    name: controller.rentRequestResponseModel
                                        .rentRequest![index].userId!.fullName
                                        .toString(),
                                    endDate: formattedEndDate,
                                    image: controller.rentRequestResponseModel
                                        .rentRequest![index].userId!.image
                                        .toString(),
                                    startDate: formattedStartDate,
                                  ),
                                )
                              : const SizedBox(),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
