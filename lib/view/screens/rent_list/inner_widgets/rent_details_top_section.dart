import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class RentDetailsTopSection extends StatelessWidget {
   const RentDetailsTopSection({super.key,
    required this.image,
    required this.carName,
    required this.carModel,
    required this.requestStatus,
    required this.carLicense,
    required this.payment,
    required this.tripStatus});

  final String image;
  final String carName;
  final String carModel;
  final String requestStatus;
  final String carLicense;
  final String payment;
  final String tripStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //Image Section
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill),
              ),
            ),

            //Car Name and Details Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: carName,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    bottom: 8),
                //Car License section
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppStaticStrings.carLic,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteDarkHover),
                      ),
                      TextSpan(
                        text: carLicense,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackNormal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                //Car Year Section
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppStaticStrings.carYear,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteDarkHover),
                      ),
                      TextSpan(
                        text: carModel,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackNormal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        tripStatus == "Pending" ?
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color:  AppColors.greenLight
          ),
          child: const CustomText(
            text: AppStaticStrings.active,
            color: AppColors.greenNormal,
            fontSize: 10,
          ),
        ) :  Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:  AppColors.redLight
          ),
          child: const CustomText(
            text: AppStaticStrings.reserved,
            color: AppColors.redNormal,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
