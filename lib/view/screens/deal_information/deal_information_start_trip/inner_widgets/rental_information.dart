import 'package:flutter/cupertino.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_model/rent_list_model.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class RentalInformation extends StatelessWidget {
  const RentalInformation({super.key, required this.rentListModel, required this.index});

  final RentListModel rentListModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text: AppStaticStrings.rentalInformation,fontSize: 16,fontWeight: FontWeight.w500,bottom: 16),

        //This Section Only Come in End Trip Section
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: AppStaticStrings.tripNo,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: "06",fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        SizedBox(height: 8),*/

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(text: AppStaticStrings.carModel,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: rentListModel.rentedCars![index].carId!.carModelName.toString(),fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(text: AppStaticStrings.carYear,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: rentListModel.rentedCars![index].carId!.year.toString(),fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: AppStaticStrings.carColor1,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: rentListModel.rentedCars![index].carId!.carColor.toString(),fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: AppStaticStrings.carLicense,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: rentListModel.rentedCars![index].carId!.carLicenseNumber.toString(),fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: AppStaticStrings.gearType1,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: rentListModel.rentedCars![index].carId!.gearType.toString(),fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: AppStaticStrings.rentalTime,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: rentListModel.rentedCars![index].totalHours.toString(),fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: AppStaticStrings.rentalDate,color: AppColors.whiteDarkHover,fontSize: 16),
            CustomText(text: "08 aug 2023 - 09 aug 2023",fontSize: 16,fontWeight:FontWeight.w500),
          ],
        ),
      ],
    );
  }
}
