import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/screens/add_cars/add_car_controller/add_car_controller.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class CarService extends StatefulWidget {
  const CarService({super.key});

  @override
  State<CarService> createState() => _CarServiceState();
}

class _CarServiceState extends State<CarService> {
  List<String> seatList = ["Baby Car Seat", "Sunroof", 'Bluetooth', 'GPS'];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(builder: (controller) {
      return Column(
        children: List.generate(
          seatList.length,
          (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = index;
                  controller.selectedText = seatList[selectedItem];
                  print(controller.selectedText);
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        border:
                            Border.all(color: AppColors.blueLight, width: 1),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomText(
                      text: seatList[index],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
