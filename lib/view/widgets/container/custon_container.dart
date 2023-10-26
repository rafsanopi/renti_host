import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
        this.height,
        this.marginTop = 20,
        this.paddingVertical = 24,
        this.paddingHorizontal = 20,
        this.radiusTopLeft = 16,
        this.radiusTopRight = 16,
        this.width = double.infinity,
        this.radiusBottomLeft = 0,
        this.radiusBottomRight = 0,
        required this.child});

  final double radiusTopLeft;
  final double radiusTopRight;
  final double paddingVertical;
  final double paddingHorizontal;
  final double width;
  final double? height;
  final Widget child;
  final double marginTop;
  final double radiusBottomLeft;
  final double radiusBottomRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      decoration: BoxDecoration(
        color: AppColors.whiteLight1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusTopLeft),
          topRight: Radius.circular(radiusTopRight),
          bottomLeft: Radius.circular(radiusBottomLeft),
          bottomRight: Radius.circular(radiusBottomRight),
        ),
      ),
      child: child,
    );
  }
}