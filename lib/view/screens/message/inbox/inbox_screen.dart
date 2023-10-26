import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/service/socket_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  TextEditingController messageController = TextEditingController();
  List<Message> messages = [];
  SocketService socketService = SocketService();
  String userId = Get.arguments[0];
  String userName = Get.arguments[1];
  String userImg = Get.arguments[2];

  getMessage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String hostUid =
        prefs.getString(SharedPreferenceHelper.userIdKey).toString();

    socketService.connectToSocket();
    socketService.joinRoom(hostId: hostUid);

    socketService.addNewChat(userHostId: {
      "participants": [userId, hostUid],
    }, hostId: hostUid);
    //socketService.joinChat(chatId: "6538fb41f7db461561d4dee4");
    // socketService.addNewMessage(
    //     message: "This is Host",
    //     hostId: hostUid,
    //     roomId: "6538fb41f7db461561d4dee4");

    socketService.getAllChats(hostId: hostUid.toString());
  }

  @override
  void initState() {
    getMessage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: CustomAppBar(
          appBarBgColor: AppColors.blueNormal,
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
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(userImg))),
                  ),
                  CustomText(
                      left: 10,
                      text: userName,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteLight)
                ],
              ),
              const Icon(Icons.phone, size: 24, color: AppColors.whiteLight)
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          child: Column(
            children:
                List.generate(socketService.allmessageList.length, (index) {
              //  Message msg = socketService.allmessageList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Align(
                  alignment:
                      (socketService.allmessageList[index].senderInfo[index] ==
                              "sender"
                          ? Alignment.topRight
                          : Alignment.topLeft),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: (messages[index].messageType == "sender"
                          ? AppColors.blueNormal
                          : AppColors.whiteLight),
                    ),
                    child: CustomText(
                      textAlign: TextAlign.start,
                      text: messages[index].messageContent,
                      color: messages[index].messageType == "sender"
                          ? AppColors.whiteLight
                          : AppColors.blackNormal,
                    ),
                  ),
                ),
              );
            }),
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
                  onTap: () async {},
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

class Message {
  final String messageContent;
  final String messageType; // "sender" or "receiver"

  Message({required this.messageContent, required this.messageType});
}
