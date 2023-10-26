import 'package:flutter/material.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChaneLanguageScreenState();
}

class _ChaneLanguageScreenState extends State<ChangeLanguageScreen> {
  List<String> languageName = [
    'English',
    'English UK',
    'Hindi',
    'Spanish',
    'Japanese',
    'Chinese',
    'Dutch',
    'Korean',
    'Swedish',
    'Bangla'
  ];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: const CustomAppBar(
          appBarContent: CustomBack(
            text: AppStaticStrings.changeLanguage,
            color: AppColors.blackNormal,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: List.generate(
                    languageName.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: Container(
                          height: 52,
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: AppColors.blueLight, width: 1),
                                  color: index == selectedItem
                                      ? AppColors.blueNormal
                                      : AppColors.whiteLight,
                                ),
                              ),
                              CustomText(
                                text: languageName[index],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 34),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
