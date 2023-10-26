import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/home/home_controller/home_carlist_controller.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  List carModel = [
    "Abul Rent Car",
    "BMW 10",
    "Marcity",
    "Lamborghini",
  ];
  int selectedItem = 0;

  final homecontroller = Get.find<HomeCarListController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCarListController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          controller.homeCarList(search: "");

          return true;
        },
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.searchController,
                  onChanged: (value) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        homecontroller.homeCarList(search: "?search=$value");
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
                    hintText: AppStaticStrings.searchCarBy,
                    hintStyle: AppStaticStrings.hintStyle,
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
              ),
              const SizedBox(width: 8),

              //Pop Up

              SizedBox(
                  width: 55,
                  child: PopupMenuButton(
                    position: PopupMenuPosition.under,
                    elevation: 1,
                    color: AppColors.whiteLight,
                    offset: const Offset(0, 1),
                    itemBuilder: (context) {
                      return List.generate(
                        carModel.length,
                        (index) {
                          return PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedItem = index;
                                  homecontroller.homeCarList(
                                      search:
                                          "?search=${carModel[selectedItem]}");
                                });
                                navigator!.pop();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == selectedItem
                                          ? AppColors.blueNormal
                                          : AppColors.whiteLight,
                                      border: Border.all(
                                          color: AppColors.blueLight, width: 1),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  CustomText(
                                    text: carModel[index],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.whiteLight,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColors.whiteNormalActive, width: 1),
                      ),
                      child: const Icon(
                        Icons.filter_list_outlined,
                        color: AppColors.whiteNormalActive,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
