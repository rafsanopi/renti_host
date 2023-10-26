import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_model/rent_list_model.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class RentalUserInformation extends StatelessWidget {
  const RentalUserInformation({super.key, required this.rentListModel, required this.index});

  final RentListModel rentListModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
            text: AppStaticStrings.userInformation,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            bottom: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                text: AppStaticStrings.name,
                color: AppColors.whiteDarkHover,
                fontSize: 16),
            CustomText(
                text: rentListModel.rentedCars![index].userId!.fullName.toString(),
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
                text: AppStaticStrings.iNE,
                color: AppColors.whiteDarkHover,
                fontSize: 16),
            CustomText(
                text: rentListModel.rentedCars![index].userId!.ine.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                text: AppStaticStrings.drivingLicense,
                color: AppColors.whiteDarkHover,
                fontSize: 16),
            CustomText(
                text: "61-10-2022",
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
                text: AppStaticStrings.pickUpLocation,
                color: AppColors.whiteDarkHover,
                fontSize: 16),
            CustomText(
                text: rentListModel.rentedCars![index].hostId!.address.toString(),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ],
        ),
      ],
    );
  }
}
