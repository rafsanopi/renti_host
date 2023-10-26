import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/profile/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:renti_host/view/screens/profile/edit_profile/edit_profile_repo/edit_profile_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';
import '../../../../service/api_service.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(EditProfileRepo(apiService: Get.find()));
    Get.put(EditProfileController(editProfileRepo: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var img = Get.arguments;
    return GetBuilder<EditProfileController>(builder: (controller) {
      return SafeArea(
        top: true,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.whiteLight,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(
                text: AppStaticStrings.profileEdit,
                color: AppColors.blackNormal),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              controller.imageFile == null
                                  ? Container(
                                      height: 150,
                                      width: double.infinity - 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                img,
                                              ),
                                              fit: BoxFit.contain)),
                                    )
                                  : Container(
                                      height: 150,
                                      width: double.infinity - 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: FileImage(File(
                                                  controller.imageFile!.path)),
                                              fit: BoxFit.contain)),
                                    ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.openGallery();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.blueNormal),
                                    child: const CustomImage(
                                        imageSrc: AppIcons.cameraIcon,
                                        size: 24),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Name and TextField
                          const CustomText(
                              text: AppStaticStrings.name1,
                              bottom: 12,
                              top: 16),
                          CustomTextField(
                            textEditingController:
                                controller.fullNameController,
                            hintText: AppStaticStrings.enterFullName,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.whiteNormalActive),
                          ),

                          //Email and TextField
                          const CustomText(
                              text: AppStaticStrings.email, top: 8, bottom: 12),
                          CustomTextField(
                            readOnly: true,
                            textEditingController: controller.emailController,
                            textInputAction: TextInputAction.done,
                            hintText: AppStaticStrings.enterEmail,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: AppColors.whiteNormalActive),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStaticStrings.notBeEmpty;
                              } else if (!value.contains(RegExp('@'))) {
                                return AppStaticStrings.enterValidEmail;
                              } else {
                                return null;
                              }
                            },
                          ),

                          //Phone Number Text and TextField
                          const CustomText(
                            text: AppStaticStrings.phoneNumber,
                            bottom: 12,
                            top: 8,
                          ),
                          SizedBox(
                            height: 56,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.whiteLight,
                                    border: Border.all(
                                        color: AppColors.whiteDark,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  child: const Row(
                                    children: [
                                      CustomImage(
                                          imageSrc: AppImages.flagImage,
                                          size: 40),
                                      CustomText(
                                          text: AppStaticStrings.phone,
                                          left: 10,
                                          color: AppColors.whiteNormalActive)
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextField(
                                    textEditingController:
                                        controller.phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    hintText: AppStaticStrings.enterPhoneNumber,
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whiteNormalActive),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const CustomText(
                              text: AppStaticStrings.address,
                              top: 8,
                              bottom: 12),
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.whiteLight,
                                border: Border.all(
                                    color: AppColors.whiteNormalActive,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                    strokeAlign: 1)),
                            child: CustomTextField(
                              textEditingController:
                                  controller.addressController,
                              textInputAction: TextInputAction.done,
                              fieldBorderColor: AppColors.whiteLight,
                              hintText: AppStaticStrings.enterAddress,
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.whiteNormalActive),
                            ),
                          ),

                          SizedBox(height: 24),

                          CustomElevatedButton(
                              onPressed: () {
                                controller.editProfile();
                              },
                              buttonWidth: double.maxFinite,
                              buttonHeight: 52,
                              titleText: AppStaticStrings.save),
                          SizedBox(height: 24),
                        ],
                      ),
                    )),
          ),
        ),
      );
    });
  }
}
