import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/home/home_model/home_carlist_model.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class ReservedDetails extends StatelessWidget {
  const ReservedDetails(
      {super.key, required this.homeCarListModel, required this.index});
  final HomeCarListModel homeCarListModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.carModel,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text: homeCarListModel.cars![index].carModelName.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.numberOfDoors,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text: homeCarListModel.cars![index].carDoors.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.seats,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text: homeCarListModel.cars![index].carSeats.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.carColor1,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text: homeCarListModel.cars![index].carColor.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.carLicense,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text: homeCarListModel.cars![index].carLicenseNumber.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.registrationDate,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text: homeCarListModel.cars![index].registrationDate.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.insuranceDate1,
                fontSize: 16,
                color: AppColors.whiteDarkHover),
            CustomText(
                text:
                    homeCarListModel.cars![index].insuranceStartDate.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),

        //This Section Needed When car in Reserved
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: AppStaticStrings.reservation,
                    fontSize: 16,
                    color: AppColors.whiteDarkHover),
                CustomText(
                    text: "10 aug 2023 - 11 aug 2024",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                    text: AppStaticStrings.userName1,
                    fontSize: 16,
                    color: AppColors.whiteDarkHover),
                CustomText(
                    text: homeCarListModel.cars![index].carDoors.toString(),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: AppStaticStrings.transitionNo,
                    fontSize: 16,
                    color: AppColors.whiteDarkHover),
                CustomText(
                    text: "1125442024",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: AppStaticStrings.tripNo,
                    fontSize: 16,
                    color: AppColors.whiteDarkHover),
                CustomText(
                    text: "10", fontSize: 16, fontWeight: FontWeight.w500),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
