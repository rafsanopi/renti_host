import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_request/rent_request_repo/rent_request_repo.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_controller/rent_request_controller.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_response_model/rent_request_response_model.dart';
import 'package:renti_host/view/screens/rent_request/user_request_details/inner_widgets/request_car_details.dart';
import 'package:renti_host/view/screens/rent_request/user_request_details/inner_widgets/request_car_details_card.dart';
import 'package:renti_host/view/screens/rent_request/user_request_details/inner_widgets/user_details_top_section.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';

class UserRequestDetailsScreen extends StatefulWidget {
  const UserRequestDetailsScreen({super.key});

  @override
  State<UserRequestDetailsScreen> createState() =>
      _UserRequestDetailsScreenState();
}

class _UserRequestDetailsScreenState extends State<UserRequestDetailsScreen> {
  RentRequestResponseModel rentRequestResponseModel = Get.arguments[0];
  int index = Get.arguments[1];
  RentReqRepo rentReqRepo = RentReqRepo(apiService: Get.find());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
              text: AppStaticStrings.userDetails, color: AppColors.blackNormal),
        ),
        body: GetBuilder<RentRequestController>(builder: (controller) {
          return LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserDetailsTopSection(
                    rentRequestResponseModel: rentRequestResponseModel,
                    index: index,
                  ),
                  RequestCarDetails(
                      index: index,
                      rentRequestResponseModel: rentRequestResponseModel),
                  RequestCarDetailsCard(
                      index: index,
                      rentRequestResponseModel: rentRequestResponseModel),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomElevatedButton(
                        onPressed: () {
                          rentReqRepo.rentRequest(
                              request: Request.rejected,
                              id: rentRequestResponseModel
                                  .rentRequest![index].id
                                  .toString());

                          controller.rentRequest();
                          navigator!.pop();
                        },
                        titleText: AppStaticStrings.cancel,
                        buttonHeight: 48,
                        titleWeight: FontWeight.w500,
                        buttonColor: AppColors.redLight,
                        titleColor: AppColors.redNormal,
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: CustomElevatedButton(
                        onPressed: () {
                          rentReqRepo.rentRequest(
                              request: Request.accepted,
                              id: rentRequestResponseModel
                                  .rentRequest![index].id
                                  .toString());

                          controller.rentRequest();
                          navigator!.pop();
                        },
                        titleText: AppStaticStrings.approve,
                        buttonHeight: 48,
                        titleWeight: FontWeight.w500,
                      )),
                    ],
                  ),
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
