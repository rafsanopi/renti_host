import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_controller/profile_controller.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/popups/common_popup.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      width: 230,
      backgroundColor: AppColors.whiteLight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        physics: const BouncingScrollPhysics(),
        child: GetBuilder<ProfileController>(builder: (controller) {
          String fullName = controller.profileModel.user!.fullName.toString();
          String phoneNumber =
              controller.profileModel.user!.phoneNumber.toString();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Drawer Top Section
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 50,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: controller.img,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              CustomText(
                  text: fullName,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  top: 8),
              CustomText(
                  text: phoneNumber,
                  fontSize: 12,
                  color: AppColors.whiteDarkHover,
                  top: 8,
                  bottom: 8),
              const Divider(color: AppColors.blackLightHover, thickness: 1),

              //Add cars Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.addCarsScreens),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.addCar, size: 18),
                      CustomText(
                          text: AppStaticStrings.addCar,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //All Car List Section
              GestureDetector(
                onTap: () => Get.toNamed(
                  AppRoute.seeAllCarList,
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.carList, size: 18),
                      CustomText(
                          text: AppStaticStrings.carList,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //All User List Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.userListScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.userList, size: 14),
                      CustomText(
                          text: AppStaticStrings.userList,
                          color: AppColors.whiteDarkHover,
                          left: 12)
                    ],
                  ),
                ),
              ),
              //All Rent List Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.rentListScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.rentList, size: 18),
                      CustomText(
                          text: AppStaticStrings.rentList,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //All Review List Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.allReview),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.reviews, size: 18),
                      CustomText(
                          text: AppStaticStrings.reviews,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //All Income List Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.incomeScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.income, size: 18),
                      CustomText(
                          text: AppStaticStrings.income,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),

              //All Notification List Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.notificationScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.notification, size: 18),
                      CustomText(
                          text: AppStaticStrings.notification,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),

              //Admin Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.adminInfoScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.adminInfo, size: 18),
                      CustomText(
                          text: AppStaticStrings.adminInfo,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //Divider
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Divider(color: AppColors.blackLightHover, thickness: 1),
              ),
              //Settings Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.settingsScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.settings, size: 18),
                      CustomText(
                          text: AppStaticStrings.settings,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //How Renti Work Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.howRentiWorks),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.howWorks, size: 18),
                      CustomText(
                          text: AppStaticStrings.howRentWorks,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //terms and Condition Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.termsAndCondition),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.termsConditions, size: 18),
                      CustomText(
                          text: AppStaticStrings.termsConditions,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //Support Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.supportScreen),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.support, size: 18),
                      CustomText(
                          text: AppStaticStrings.support,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //About Us Section
              GestureDetector(
                onTap: () => Get.toNamed(AppRoute.aboutUs),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.termsConditions, size: 18),
                      CustomText(
                          text: AppStaticStrings.aboutUs,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
              //Divider
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Divider(color: AppColors.blackLightHover, thickness: 1),
              ),
              //LogOut Section
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => CommonPopUp(
                      title: AppStaticStrings.alertMessage,
                      onTapYes: () {
                        Get.offAllNamed(AppRoute.signInScreen);
                      },
                      onTapNo: () {
                        Navigator.of(context).pop();
                      }),
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Row(
                    children: [
                      CustomImage(
                          imageSrc: AppIcons.logOut,
                          size: 18,
                          imageColor: AppColors.whiteDarkHover),
                      CustomText(
                          text: AppStaticStrings.logOut,
                          color: AppColors.whiteDarkHover,
                          left: 8)
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
