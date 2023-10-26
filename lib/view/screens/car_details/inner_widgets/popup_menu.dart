import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/home/home_controller/home_carlist_controller.dart';
import 'package:renti_host/view/screens/home/home_model/home_carlist_model.dart';
import 'package:renti_host/view/screens/car_details/delete_car_repo/delete_car_repo.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu(
      {super.key, required this.homeCarListModel, required this.index});
  final HomeCarListModel homeCarListModel;
  final int index;
  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.whiteLight,
      icon: const Icon(
        Icons.more_vert_outlined,
        color: Colors.black,
        size: 18,
      ),
      elevation: 1,
      position: PopupMenuPosition.under,
      itemBuilder: (context) => [
        PopupMenuItem(
            child: GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoute.addCarsScreens);
          },
          child: const Row(
            children: [
              Icon(
                Icons.edit_note_outlined,
                size: 20,
                color: AppColors.blackNormal,
              ),
              CustomText(text: AppStaticStrings.editCar, left: 16),
            ],
          ),
        )),
        PopupMenuItem(
          child: InkWell(
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Column(
                      children: [
                        const CustomText(
                          text: AppStaticStrings.wantToDeleteCar,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 0),
                          child: Divider(
                            height: 1,
                            color: AppColors.blackLightHover,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomElevatedButton(
                                    onPressed: () {
                                      DeleteCarRepo(apiService: Get.find())
                                          .deleteCar(
                                              carId: widget.homeCarListModel
                                                  .cars![widget.index].id
                                                  .toString());

                                      var homeController =
                                          Get.find<HomeCarListController>();
                                      homeController.homeCarList();
                                      Get.offNamed(AppRoute.navigation);
                                    },
                                    titleText: AppStaticStrings.yes,
                                    buttonColor: AppColors.redLight,
                                    titleColor: AppColors.redNormal,
                                    buttonHeight: 48)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  titleText: AppStaticStrings.no,
                                  buttonHeight: 48),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Row(
              children: [
                Icon(
                  Icons.delete,
                  size: 20,
                  color: AppColors.redNormal,
                ),
                CustomText(
                    text: AppStaticStrings.deleteCar,
                    left: 16,
                    color: AppColors.redNormal),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
