import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/service/socket_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/device_utils.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<ChatMessage> messages = [];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.blueNormal,
        appBar: CustomAppBar(
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios_rounded,
                        size: 18, color: AppColors.whiteLight),
                  ),
                  Container(
                    height: 52,
                    width: 52,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const CustomImage(
                        imageSrc: AppImages.userImage,
                        imageType: ImageType.png,
                        size: 52),
                  ),
                  const CustomText(
                      text: AppStaticStrings.bessieCooper,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteLight)
                ],
              ),
              const Icon(Icons.phone, size: 24, color: AppColors.whiteLight)
            ],
          ),
        ),
        body: CustomContainer(
          radiusTopLeft: 16,
          radiusTopRight: 16,
          paddingVertical: 0,
          paddingHorizontal: 0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 24, bottom: 100),
            child: Column(
              children: List.generate(
                messages.length,
                (index) => Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: Align(
                    alignment: (messages[index].messageType == "sender"
                        ? Alignment.topRight
                        : Alignment.topLeft),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: (messages[index].messageType == "sender"
                            ? AppColors.blueNormal
                            : AppColors.whiteNormalHover),
                      ),
                      child: CustomText(
                          textAlign: TextAlign.start,
                          text: messages[index].messageContent,
                          color: messages[index].messageType == "sender"
                              ? AppColors.whiteLight
                              : AppColors.blackNormal),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16, horizontal: 20),
            width: MediaQuery.of(context).size.width,
            decoration: const ShapeDecoration(
              color: AppColors.whiteLight,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: AppColors.whiteLight),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteLight,
                      border: Border.all(
                          color: AppColors.whiteNormalActive,
                          style: BorderStyle.solid,
                          width: 1.0,
                          strokeAlign: 1),
                    ),
                    child: CustomTextField(
                      textEditingController: messageController,
                      textInputAction: TextInputAction.done,
                      fieldBorderColor: AppColors.whiteLight,
                      hintText: AppStaticStrings.enterAddress,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteNormalActive),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // sendMessage();
                  },
                  child:
                      const CustomImage(imageSrc: AppIcons.sendIcon, size: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;

  ChatMessage({required this.messageContent, required this.messageType});
}
