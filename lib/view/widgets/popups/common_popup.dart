import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CommonPopUp extends StatelessWidget {
  const CommonPopUp(
      {super.key,
      required this.title,
      required this.onTapYes,
      required this.onTapNo});

  final String title;
  final VoidCallback onTapYes;
  final VoidCallback onTapNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(text: title, fontSize: 18, fontWeight: FontWeight.w600),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Divider(
              height: 1,
              color: AppColors.blackLightHover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onPressed: onTapYes,
                  titleText: AppStaticStrings.yes,
                  buttonColor: AppColors.redLight,
                  titleColor: AppColors.redNormal,
                  buttonHeight: 48,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomElevatedButton(
                  onPressed: onTapNo,
                  titleText: AppStaticStrings.no,
                  buttonHeight: 48,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
