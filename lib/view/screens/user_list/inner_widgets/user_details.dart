import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/view/screens/user_list/inner_widgets/user_list_dialog_box.dart';
import 'package:renti_host/view/screens/user_list/user_list_controller/user_list_controller.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class UserDetails extends StatelessWidget {

  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<UserListController>(
      builder: (controller) {
        if (controller.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: List.generate(
            controller.userList.length,
            (index) {
              return
                controller.userList[index].payment == "Completed"?
                GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: UserListDialogBox(
                        index: index,
                        userListResponseModel: controller.userListResponseModel),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 8),
                  // height: 86,
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 16, horizontal: 16),
                  decoration: ShapeDecoration(
                    color: AppColors.whiteLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller.userList[index].userId!.image.toString(),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text:controller.userList[index].userId!.fullName.toString(),
                                  fontSize: 18,maxLines: 2,
                                  fontWeight: FontWeight.w500,
                                  bottom: 8),

                               controller.userList[index].userId!.averageRatings != null ?
                               Row(
                                children: [
                                  const CustomImage(
                                    imageSrc: AppImages.starImage,
                                    size: 12,
                                  ),
                                  CustomText(text: "(${controller.userList[index].userId!.averageRatings.toString()})", fontSize: 10,left: 4)
                                ],
                              ) : const SizedBox(),
                            ],
                          ),
                        ],
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
                              color: controller.userList[index].requestStatus == "Completed" ? AppColors.greenLight : AppColors.redLight),
                            child: controller.userList[index].requestStatus == "Completed" ?
                            CustomText(
                              text: controller.userList[index].requestStatus.toString(),
                              color: AppColors.greenNormal,
                              fontSize: 10,
                            ) :
                               // controller.userList[index].carId!.tripStatus == "Start"?
                            CustomText(
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
                                  borderRadius: BorderRadius.circular(4),
                                ),
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
                ),
              ) : const SizedBox();
            },
          ),
        );
      },
    );
  }
}
