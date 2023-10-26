import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class AllReviewTopSection extends StatelessWidget {
  final String userName;
  final String carLicense;
  final String date;
  final String userImg;

  final String carImg;
  final String ratting;

  const AllReviewTopSection({
    super.key,
    required this.userName,
    required this.carLicense,
    required this.date,
    required this.userImg,
    required this.carImg,
    required this.ratting,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(userImg), fit: BoxFit.fill),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: userName,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  RatingBarIndicator(
                    unratedColor: AppColors.whiteDark,
                    rating: double.parse(ratting),
                    itemBuilder: (context, index) =>
                        const Icon(Icons.star, color: AppColors.ratingColor),
                    itemCount: 5,
                    itemSize: 12.0,
                    direction: Axis.horizontal,
                  ),
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
                  //Date Of review section
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppStaticStrings.date,
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteDarkHover),
                        ),
                        TextSpan(
                          text: date,
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
        ),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(carImg),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle),
        ),
      ],
    );
  }
}
