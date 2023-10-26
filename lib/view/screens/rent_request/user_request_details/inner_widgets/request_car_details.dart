import 'package:flutter/cupertino.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/rent_request/user_request/rent_request_response_model/rent_request_response_model.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class RequestCarDetails extends StatefulWidget {
  const RequestCarDetails(
      {super.key, required this.rentRequestResponseModel, required this.index});
  final RentRequestResponseModel rentRequestResponseModel;
  final int index;

  @override
  State<RequestCarDetails> createState() => _RequestCarDetailsState();
}

class _RequestCarDetailsState extends State<RequestCarDetails> {
  @override
  Widget build(BuildContext context) {
    String startDateString = widget
        .rentRequestResponseModel.rentRequest![widget.index].startDate
        .toString();

    String endDateString = widget
        .rentRequestResponseModel.rentRequest![widget.index].endDate
        .toString();

    // Define a regular expression pattern to match the date part
    RegExp datePattern = RegExp(r"(\d{4}-\d{2}-\d{2})");

    // Use the regular expression to extract the date part
    String formattedStartDate =
        datePattern.firstMatch(startDateString)?.group(0) ?? '';

    String formattedEndDate =
        datePattern.firstMatch(endDateString)?.group(0) ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  text: AppStaticStrings.rentDate,
                  fontSize: 16,
                  color: AppColors.whiteDarkHover),
              CustomText(
                  text: "$formattedStartDate - $formattedEndDate",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  text: AppStaticStrings.totalTime,
                  fontSize: 16,
                  color: AppColors.whiteDarkHover),
              CustomText(
                  text:
                      "${widget.rentRequestResponseModel.rentRequest![widget.index].totalHours.toString()}h",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  text: AppStaticStrings.contact,
                  fontSize: 16,
                  color: AppColors.whiteDarkHover),
              CustomText(
                  text: widget.rentRequestResponseModel
                          .rentRequest![widget.index].userId!.phoneNumber
                          .toString() ??
                      "",
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                  text: AppStaticStrings.totalAmount,
                  fontSize: 16,
                  color: AppColors.whiteDarkHover),
              CustomText(
                  text:
                      '\$${widget.rentRequestResponseModel.rentRequest![widget.index].totalAmount.toString() ?? ""}',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }
}
