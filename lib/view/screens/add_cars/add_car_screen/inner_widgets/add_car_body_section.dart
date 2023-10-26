import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/add_cars/add_car_controller/add_car_controller.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';
import 'package:renti_host/view/widgets/textfield/custom_textfield.dart';

class AddCarBodySection extends StatefulWidget {
  const AddCarBodySection({super.key});

  @override
  State<AddCarBodySection> createState() => _AddCarBodySectionState();
}

class _AddCarBodySectionState extends State<AddCarBodySection> {
  List<String> timeList = [
    "2024",
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
    "2009",
    "2008",
    "2007",
    "2006",
    "2005",
    "2004",
    "2003",
    "2002",
    "2001",
    "2000"
  ];

  @override
  Widget build(BuildContext context) {
    var hintStyle = GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteNormalActive);

    return GetBuilder<AddCarController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
              text: AppStaticStrings.carModelName, bottom: 12, top: 16),

          //Care Model Name Text and TextField with select year section
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    textEditingController: controller.carModelName,
                    hintText: AppStaticStrings.enterCarName,
                    hintStyle: hintStyle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              AppColors.whiteNormalActive), // Set border color
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: DropdownButton<String>(
                      underline: Container(
                        height: 0,
                      ),
                      value: controller.selectedYear.toString(),
                      onChanged: (newValue) {
                        setState(() {
                          controller.selectedYear = newValue!;
                        });
                      },
                      items: timeList.map((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Car license and TextField
          const CustomText(
              text: AppStaticStrings.carLicenseNumber, top: 16, bottom: 12),
          CustomTextField(
              textEditingController: controller.carLicenseNumber,
              hintText: AppStaticStrings.enterLicense,
              hintStyle: hintStyle),

          //Car Description and TextField
          const CustomText(
              text: AppStaticStrings.carDescription, top: 16, bottom: 12),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteLight,
              border: Border.all(
                color: AppColors.whiteNormalActive,
                style: BorderStyle.solid,
                width: 1.0,
                strokeAlign: 1,
              ),
            ),
            child: CustomTextField(
              textEditingController: controller.carDescription,
              textInputAction: TextInputAction.done,
              fieldBorderColor: AppColors.whiteLight,
              hintText: AppStaticStrings.enterDescription,
              hintStyle: hintStyle,
            ),
          ),

          //Set Rent Amount and TextField
          const CustomText(
              text: AppStaticStrings.setRentAmount, top: 16, bottom: 12),
          CustomTextField(
              textEditingController: controller.carRentAmmount,
              hintText: AppStaticStrings.enterAmount,
              hintStyle: hintStyle),

          //Insurance Date And Selected Date section
          const CustomText(
              text: AppStaticStrings.insuranceDate, top: 16, bottom: 12),
          SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.insuranceStartDate,
                    showCursor: true,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackNormal),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.calendar_month_rounded,
                        size: 24,
                        color: AppColors.whiteDarkHover,
                      ),
                      hintText: AppStaticStrings.startDate,
                      hintStyle: hintStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.whiteNormalActive, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.whiteNormalActive, width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: controller.insuranceEndDate,
                    showCursor: true,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackNormal),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.calendar_month_rounded,
                        size: 24,
                        color: AppColors.whiteDarkHover,
                      ),
                      hintText: AppStaticStrings.endDate,
                      hintStyle: hintStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.whiteNormalActive, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.whiteNormalActive, width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
