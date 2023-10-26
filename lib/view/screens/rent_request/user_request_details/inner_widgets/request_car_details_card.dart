import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_icons.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_response_model/rent_request_response_model.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class RequestCarDetailsCard extends StatefulWidget {
  const RequestCarDetailsCard(
      {super.key, required this.rentRequestResponseModel, required this.index});
  final RentRequestResponseModel rentRequestResponseModel;
  final int index;

  @override
  State<RequestCarDetailsCard> createState() => _RequestCarDetailsCardState();
}

class _RequestCarDetailsCardState extends State<RequestCarDetailsCard> {
  @override
  Widget build(BuildContext context) {
    String carImg = widget
        .rentRequestResponseModel.rentRequest![widget.index].carId!.image![0]
        .toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
            text: AppStaticStrings.carDetails,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackNormal),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsetsDirectional.symmetric(vertical: 16),
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blueLight, width: 1),
            color: AppColors.whiteLight,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.rentRequestResponseModel
                          .rentRequest![widget.index].carId!.carModelName
                          .toString(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueDark,
                      textAlign: TextAlign.start,
                    ),
                    CustomText(
                      text: widget.rentRequestResponseModel
                          .rentRequest![widget.index].carId!.carLicenseNumber
                          .toString(),
                      color: AppColors.whiteDarkActive,
                      top: 8,
                      bottom: 8,
                      textAlign: TextAlign.start,
                    ),
                    CustomText(
                      text: widget.rentRequestResponseModel
                              .rentRequest![widget.index].carId!.totalRun
                              .toString() ??
                          "",
                      color: AppColors.whiteDarkActive,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text:
                          "${widget.rentRequestResponseModel.rentRequest![widget.index].carId!.hourlyRate.toString()}\$/h" ??
                              "",
                      color: AppColors.whiteDarkActive,
                    ),
                  ],
                ),
              ),
              Expanded(child: Image.network(carImg)),
            ],
          ),
        ),
      ],
    );
  }
}
