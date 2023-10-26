import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_images.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_response_model/rent_request_response_model.dart';
import 'package:renti_host/view/widgets/image/custom_image.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class UserDetailsTopSection extends StatefulWidget {
  const UserDetailsTopSection(
      {super.key, required this.rentRequestResponseModel, required this.index});
  final RentRequestResponseModel rentRequestResponseModel;
  final int index;

  @override
  State<UserDetailsTopSection> createState() => _UserDetailsTopSectionState();
}

class _UserDetailsTopSectionState extends State<UserDetailsTopSection> {
  @override
  Widget build(BuildContext context) {
    String img = widget
        .rentRequestResponseModel.rentRequest![widget.index].userId!.image
        .toString();

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: img,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.rentRequestResponseModel
                        .rentRequest![widget.index].userId!.fullName
                        .toString(),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blueNormal,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => const CustomImage(
                            imageSrc: AppImages.starImage,
                            size: 12,
                          ),
                        ),
                      ),
                      const CustomText(
                          text: AppStaticStrings.rating, fontSize: 10, left: 8),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.call,
                  size: 18,
                  color: AppColors.blueNormal,
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.message,
                  size: 18,
                  color: AppColors.blueNormal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
