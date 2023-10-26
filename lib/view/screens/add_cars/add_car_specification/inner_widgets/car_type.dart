import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/screens/add_cars/add_car_controller/add_car_controller.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CarType extends StatefulWidget {
  const CarType({super.key});

  @override
  State<CarType> createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  List<String> types = ["Standard", "Luxury"];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: AppStaticStrings.carType, bottom: 12, top: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              types.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedItem = index;
                      controller.selectedCarType = types[selectedItem];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == selectedItem
                                ? AppColors.blueNormal
                                : AppColors.whiteLight,
                            border: Border.all(
                                color: AppColors.blueLight, width: 1),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomText(
                          text: types[index],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
