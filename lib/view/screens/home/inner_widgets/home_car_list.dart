import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/%20home/home_model/home_carlist_model.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

// ignore: must_be_immutable
class HomeCarList extends StatefulWidget {
  HomeCarList({super.key, required this.homeCarListModel});

  HomeCarListModel homeCarListModel;

  @override
  State<HomeCarList> createState() => _HomeCarListState();
}

class _HomeCarListState extends State<HomeCarList> {
  Map<int, bool> expandedMap = {};

  void onChanged(int index) {
    setState(
      () {
        if (expandedMap.containsKey(index)) {
          expandedMap[index] = !expandedMap[index]!;
        } else {
          expandedMap[index] = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.homeCarListModel.cars!.length,
        (index) {
          final isExpanded = expandedMap[index] ?? false;
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.carDetailsScreen,
                      arguments: [widget.homeCarListModel, index]);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 140,
                        padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  widget.homeCarListModel.cars![index].image![0]
                                      .toString(),
                                ))),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: AppColors.blueLight,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                        text: widget.homeCarListModel
                                            .cars![index].carModelName
                                            .toString(),
                                        maxLines: 1,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.blueNormal,
                                        textAlign: TextAlign.start,
                                        right: 10),
                                  ),
                                  widget.homeCarListModel.cars![index]
                                              .tripStatus ==
                                          "Start"
                                      ? Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsetsDirectional
                                              .symmetric(
                                              vertical: 4, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: AppColors.redLight,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: const CustomText(
                                              text: AppStaticStrings.reserved,
                                              fontSize: 10,
                                              color: AppColors.redNormal),
                                        )
                                      : Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsetsDirectional
                                              .symmetric(
                                              vertical: 4, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: AppColors.greenLight,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: const CustomText(
                                            text: AppStaticStrings.active,
                                            fontSize: 10,
                                            color: AppColors.greenNormal,
                                          ),
                                        ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          text:
                                              "\$${widget.homeCarListModel.cars![index].hourlyRate.toString()}",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteDarker),
                                      const CustomText(
                                          text: AppStaticStrings.perDay,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteDarker),
                                    ],
                                  ),
                                  widget.homeCarListModel.cars![index]
                                              .tripStatus ==
                                          "Start"
                                      ? GestureDetector(
                                          onTap: () {
                                            onChanged(index);
                                          },
                                          child: Icon(
                                              isExpanded
                                                  ? Icons
                                                      .keyboard_arrow_up_rounded
                                                  : Icons
                                                      .keyboard_arrow_down_rounded,
                                              color: AppColors.blueNormal,
                                              size: 18,
                                              weight: 10),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // dataList[index]["status"] == "Reserved" && isExpanded
              //     ? StartEndDate()
              //     : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
