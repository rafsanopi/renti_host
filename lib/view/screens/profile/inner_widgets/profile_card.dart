import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.whiteDarkHover, size: 18),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: title,
                    fontSize: 12,
                    color: AppColors.whiteDarkHover,
                    bottom: 8),
                CustomText(
                    overflow: TextOverflow.ellipsis,
                    text: description,
                    fontSize: 16)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
