import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class DropDown extends StatefulWidget {
  final List<String> itemList;
  final Color fillColor;
  final Color borderColor;
  final Color prefixColor;

  final double borderRadius;
  final double width;

  const DropDown(
      {super.key,
      required this.itemList,
      this.fillColor = Colors.white,
      this.borderRadius = 8,
      this.width = double.maxFinite,
      this.borderColor = AppColors.whiteNormalActive,
      this.prefixColor = AppColors.whiteNormalActive});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String selectedTime = "";
  bool prefix = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.50, color: widget.borderColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.50, color: widget.borderColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.borderColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        hint: const CustomText(
          text: "Year",fontSize: 14,color: AppColors.whiteNormalActive,
        ),
        items: widget.itemList
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: CustomText(left: 0, text: item),
              ),
            )
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please Select Year';
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            prefix = false;
          });
        },
        onSaved: (value) {
          selectedTime = value!;
        },
        buttonStyleData: const ButtonStyleData(

        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black26,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.only(left: 16),
        ),
      ),
    );
  }
}
