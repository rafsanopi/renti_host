import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CustomBack extends StatelessWidget {
  const CustomBack(
      {super.key,
      this.horizontal = 0,
      this.vertical = 0,
      this.text = "",
      this.fontSize = 18,
      this.height,
      this.left = 8,
      this.fontWeight = FontWeight.w500,
      this.color = AppColors.whiteLight,
      this.ontap,
      this.isBack = true});

  final double horizontal;
  final VoidCallback? ontap;
  final double vertical;
  final String text;
  final double fontSize;
  final double? height;
  final bool isBack;
  final double left;
  final FontWeight fontWeight;
  final Color color;

  void defaultCallback() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //   ontap!();
        isBack ? Get.back() : ontap!();
      },
      child: Container(
        height: height,
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_new, size: fontSize, color: color),
            CustomText(
              left: left,
              text: text,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
