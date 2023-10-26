import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/user_list/user_list_response_model/user_list_response_model.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class UserListDialogBox extends StatefulWidget {
  const UserListDialogBox(
      {super.key, required this.index, required this.userListResponseModel});

  final int index;
  final UserListResponseModel userListResponseModel;

  @override
  State<UserListDialogBox> createState() => _UserListDialogBoxState();
}

class _UserListDialogBoxState extends State<UserListDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: ShapeDecoration(
            color: AppColors.whiteLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.userListResponseModel
                                    .userList![widget.index].userId!.image
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: widget.userListResponseModel
                                    .userList![widget.index].userId!.fullName
                                    .toString(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                bottom: 8),
                            Row(
                              children: [
                                const CustomImage(
                                  imageSrc: AppImages.starImage,
                                  size: 12,
                                ),
                                CustomText(
                                  text: widget
                                      .userListResponseModel
                                      .userList![widget.index]
                                      .userId!
                                      .averageRatings
                                      .toString(),
                                  fontSize: 10,
                                  left: 8,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: widget.userListResponseModel.userList![widget.index].requestStatus == "Completed" ? AppColors.greenLight : AppColors.redLight),
                        child: widget.userListResponseModel.userList![widget.index].requestStatus == "Completed" ?
                        CustomText(
                          text: widget.userListResponseModel.userList![widget.index].requestStatus.toString(),
                          color: AppColors.greenNormal,
                          fontSize: 10,
                        ) :
                        const CustomText(
                          text: "Reserved",
                          color: AppColors.redNormal,
                          fontSize: 10,
                        ) ,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                color: AppColors.blueLight,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Icon(
                              Icons.call,
                              size: 18,
                              color: AppColors.blueNormal,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.blueLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.messenger_outline,
                              size: 18,
                              color: AppColors.blueNormal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      text: AppStaticStrings.contact,
                      fontSize: 16,
                      color: AppColors.whiteDarkHover),
                  CustomText(
                      text: widget.userListResponseModel.userList![widget.index]
                          .userId!.phoneNumber
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      text: AppStaticStrings.email,
                      fontSize: 16,
                      color: AppColors.whiteDarkHover),
                  CustomText(
                      text: widget.userListResponseModel.userList![widget.index]
                          .userId!.email
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      text: AppStaticStrings.tripNo,
                      fontSize: 16,
                      color: AppColors.whiteDarkHover),
                  CustomText(
                      text: widget.userListResponseModel.userList![widget.index]
                          .rentTripNumber
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
