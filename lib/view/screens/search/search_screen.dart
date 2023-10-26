import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/home/home_controller/home_carlist_controller.dart';
import 'package:renti_host/view/screens/home/inner_widgets/home_car_list.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCarListController>(builder: (controller) {
      if (controller.isLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: CustomAppBar(
            appBarContent: CustomBack(
                isBack: false,
                ontap: () {
                  controller.homeCarList(search: "");
                  navigator!.pop();
                },
                text: AppStaticStrings.search,
                color: AppColors.blackNormal),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.searchController,
                  onChanged: (value) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        controller.homeCarList(search: "?search=$value");
                      },
                    );
                  },
                  cursorColor: AppColors.blackNormal,
                  showCursor: true,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackNormal),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_outlined,
                        size: 20, color: AppColors.whiteNormalActive),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.searchController.clear();
                        controller.homeCarList(search: "");
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 15,
                        color: AppColors.blueNormal,
                      ),
                    ),
                    hintText: AppStaticStrings.findCarModel,
                    hintStyle: const TextStyle(
                        color: AppColors.whiteNormalActive,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.whiteNormalActive, width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.whiteNormalActive, width: 1),
                    ),
                  ),
                ),
                HomeCarList(
                  homeCarListModel: controller.homeCarListModel,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
