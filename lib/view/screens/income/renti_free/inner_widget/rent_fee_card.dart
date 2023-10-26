import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/start_end_date/start_end_date.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class RentFeeCard extends StatefulWidget {
  const RentFeeCard({super.key});

  @override
  State<RentFeeCard> createState() => _RentFeeCardState();
}

class _RentFeeCardState extends State<RentFeeCard> {
  List<Map<String, String>> dataList = [
    {
      "image": AppImages.blueCar,
      "carModel": "Toyota Harrier",
      "TransitionID": "1223435566",
      "Trip no": "1",
      "amount": " \$30"
    },
    {
      "image": AppImages.blueCar,
      "carModel": "Toyota Harrier",
      "TransitionID": "1223435566",
      "Trip no": "2",
      "amount": " \$20"
    },
    {
      "image": AppImages.blueCar,
      "carModel": "Toyota Harrier",
      "TransitionID": "1223435566",
      "Trip no": "3",
      "amount": " \$30"
    },
    {
      "image": AppImages.blueCar,
      "carModel": "Toyota Harrier",
      "TransitionID": "1223435566",
      "Trip no": "4",
      "amount": " \$35"
    },
  ];

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
        dataList.length,
        (index) {
          final isExpanded = expandedMap[index] ?? false;
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                decoration: ShapeDecoration(
                  color: AppColors.whiteLight,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 0.50, color: AppColors.blueLight),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(dataList[index]["image"]!),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: dataList[index]["carModel"].toString(),
                                color: AppColors.blueNormal,
                                fontWeight: FontWeight.w700,
                              ),
                              CustomText(
                                text: dataList[index]["amount"]!,
                                textAlign: TextAlign.right,
                                color: AppColors.blueNormal,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStaticStrings.transitionNo,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteDarkHover,
                                  ),
                                ),
                                TextSpan(
                                  text: dataList[index]["TransitionID"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackNormal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppStaticStrings.tripNo,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whiteDarkHover,
                                      ),
                                    ),
                                    TextSpan(
                                      text: dataList[index]["Trip no"],
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackNormal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onChanged(index);
                                },
                                child: Icon(isExpanded
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.blueNormal,
                                    size: 18,
                                    weight: 10),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isExpanded ? StartEndDate() : const SizedBox(),
              const SizedBox(height: 8)
            ],
          );
        },
      ),
    );
  }
}
