import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/user_list/inner_widgets/user_details.dart';
import 'package:renti_host/view/screens/user_list/user_list_controller/user_list_controller.dart';
import 'package:renti_host/view/screens/user_list/user_list_repo/user_list_repo.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(UserListRepo(apiService: Get.find()));
    final controller = Get.put(UserListController(userListRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.userListData();
    });
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
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
              text: AppStaticStrings.userList, color: AppColors.blackNormal),
        ),
        body: GetBuilder<UserListController>(
          builder: (controller) {
            if (controller.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return LayoutBuilder(
              builder: (context, constraint) {
                return const SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: UserDetails(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
