import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/service/socket_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/device_utils.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/popups/common_popup.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  SocketService socketService = SocketService();
  String hostUid = "";

  String userUid = "651c1438254d5546b335bd43";
  getHostID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(SharedPreferenceHelper.userIdKey);

    hostUid = id.toString();

    setState(() {
      hostMsg();
    });
  }

  hostMsg() {
    socketService.connectToSocket();
    socketService.joinRoom(hostId: hostUid);

    // socketService.addNewChat(userHostId: {
    //   "participants": [userUid, hostUid],
    // }, hostId: hostUid);
    // socketService.joinChat(chatId: "6538fb41f7db461561d4dee4");
    // socketService.addNewMessage(
    //     message: "This is Host",
    //     hostId: hostUid,
    //     roomId: "6538fb41f7db461561d4dee4");
    setState(() {
      socketService.getAllChats(hostId: hostUid);
    });
    setState(() {});
  }

  // userMsg({required String hostUid, required String userUid}) {
  //   socketService.connectToSocket();
  //   socketService.joinRoom(hostId: userUid);

  //   socketService.addNewChat(userHostId: {
  //     "participants": [userUid, hostUid],
  //   }, hostId: userUid);
  //   socketService.joinChat(chatId: "6538fb41f7db461561d4dee4");
  //   // socketService.addNewMessage(
  //   //     message: "This is User",
  //   //     hostId: userUid,
  //   //     roomId: "6538fb41f7db461561d4dee4");
  //   // socketService.getAllChats(roomId: "6538fb41f7db461561d4dee4");
  // }

  @override
  void initState() {
    Get.put(SocketService());
    //
    getHostID();

    DeviceUtils.screenUtils();
    //

    // userMsg(hostUid: hostUid, userUid: userUid);

    super.initState();
  }

  @override
  void dispose() {
    socketService.disconnect(hostId: "65156b821ae339b4d6643ac7");
    super.dispose();
  }

  final List<Map<String, String>> dataList = [
    {
      "image": AppImages.userImage,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.reserved,
    },
    {
      "image": AppImages.userImage1,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.complete,
    },
    {
      "image": AppImages.profileImage,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.reserved,
    },
    {
      "image": AppImages.userImage,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.reserved,
    },
    {
      "image": AppImages.userImage1,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.complete,
    },
    {
      "image": AppImages.profileImage,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.reserved,
    },
    {
      "image": AppImages.userImage,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.reserved,
    },
    {
      "image": AppImages.userImage1,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.complete,
    },
    {
      "image": AppImages.profileImage,
      "document": AppStaticStrings.messageDemo,
      "status": AppStaticStrings.reserved,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomText(
              text: AppStaticStrings.messages,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        body: GetBuilder<SocketService>(
          builder: (controller) {
            return controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    child: Column(
                      children: List.generate(
                        controller.allchatList.length,
                        (index) {
                          Chat chat = controller.allchatList[index];
                          print(chat);

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.inboxScreen);
                              },
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                        onPressed: (v) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CommonPopUp(
                                                  title: AppStaticStrings
                                                      .deleteMessage,
                                                  onTapYes: () {},
                                                  onTapNo: () {});
                                            },
                                          );
                                        },
                                        backgroundColor: AppColors.redNormal,
                                        icon: CupertinoIcons.delete),
                                  ],
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(16),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: AppColors.shadowColor,
                                        blurRadius: 10,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 52,
                                        width: 52,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(chat
                                                    .participants[index].image
                                                    .toString()))),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                    text: chat
                                                        .participants[index]
                                                        .fullName,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: dataList[index]
                                                                ["status"] ==
                                                            "Reserved"
                                                        ? AppColors.redLight
                                                        : AppColors.greenLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: CustomText(
                                                      text: dataList[index]
                                                              ["status"]
                                                          .toString(),
                                                      fontSize: 10,
                                                      color: dataList[index]
                                                                  ["status"] ==
                                                              "Reserved"
                                                          ? AppColors.redNormal
                                                          : AppColors
                                                              .greenNormal),
                                                ),
                                              ],
                                            ),
                                            CustomText(
                                              text: dataList[index]["document"]
                                                  .toString(),
                                              fontSize: 12,
                                              color: AppColors.whiteDark,
                                              textAlign: TextAlign.start,
                                              top: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
