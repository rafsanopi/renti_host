import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
        this.maxLines ,
        this.textAlign = TextAlign.center,
        this.left = 0,
        this.right = 0,
        this.top = 0,
        this.bottom = 0,
        this.fontSize = 14,
        this.fontWeight =FontWeight.w400,
        this.color = AppColors.blackNormal,
        this.text = "",
        this.overflow = TextOverflow.fade,
      });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int ? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(textAlign: textAlign,
        text,maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}