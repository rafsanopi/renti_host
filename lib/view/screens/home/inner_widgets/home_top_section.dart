import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class HomeTopSection extends StatelessWidget {
  final String totalCar;
  final String activeCar;
  final String reservedCar;

  const HomeTopSection(
      {super.key,
      required this.totalCar,
      required this.activeCar,
      required this.reservedCar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Total Car section
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: AppColors.blueLight),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text: AppStaticStrings.totalCar,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  CustomText(
                      text: totalCar,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      top: 8,
                      color: AppColors.blueNormal),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),

        //Total Active Car section
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: AppColors.blueLight),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text: AppStaticStrings.active,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  CustomText(
                      text: activeCar,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      top: 8,
                      color: AppColors.greenNormal),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),

        //Total Reserved Car section
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: ShapeDecoration(
              color: AppColors.whiteLight,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: AppColors.blueLight),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text: AppStaticStrings.reserved,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  CustomText(
                      text: reservedCar,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      top: 8,
                      color: AppColors.redNormal),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
