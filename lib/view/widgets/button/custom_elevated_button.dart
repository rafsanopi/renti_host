import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double? buttonWidth;
  final TextAlign textAlign;
  final Color buttonBorderColor;

  const CustomElevatedButton(
      {this.textAlign = TextAlign.center,
      this.buttonBorderColor = Colors.transparent,
      required this.onPressed,
      required this.titleText,
      this.titleColor = AppColors.whiteLight,
      this.buttonColor = AppColors.blueNormal,
      this.titleSize = 18,
      this.buttonRadius = 8,
      this.titleWeight = FontWeight.w600,
      this.buttonHeight = 56,
      this.buttonWidth,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
                side: BorderSide(color: buttonBorderColor)),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: CustomText(
          text: titleText,
          textAlign: textAlign,
          fontSize: titleSize,
          fontWeight: titleWeight,
          color: titleColor,
        ),
      ),
    );
  }
}
