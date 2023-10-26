import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CustomRentDetails extends StatelessWidget {
  const CustomRentDetails(
      {super.key,
       this.title = "",
       this.data = "",
       this.fontSize = 12});

  final String title;
  final String data;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          textAlign: TextAlign.start,
          text: title,
          color: AppColors.whiteDarkHover,
          fontSize: fontSize,
        ),
        CustomText(text: data, fontSize: fontSize,textAlign: TextAlign.end)
      ],
    );
  }
}
