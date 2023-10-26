import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
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
    'Bangla',
    'Bangla',
    'Bangla',
    'Bangla',
    'Bangla',
  ];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: const CustomAppBar(appBarContent: CustomBack(text: AppStaticStrings.selectLanguage,),),
        backgroundColor: AppColors.blueNormal,
        body: CustomContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          paddingHorizontal: 0,paddingVertical: 0,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 24,left: 20,bottom: 100,right: 20),
              child: Column(
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
                        margin: const EdgeInsets.only(bottom: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: ShapeDecoration(
                          color: AppColors.whiteLight,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: AppColors.whiteLight1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 10,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.black12.withOpacity(.2),
                                      width: 1),
                                  color: index == selectedItem
                                      ? AppColors.blueNormal
                                      : AppColors.whiteLight,
                                ),
                              ),
                              CustomText(
                                text: languageName[index],
                                color: AppColors.blackNormal,
                                left: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoute.signInScreen);
              }, titleText: AppStaticStrings.confirm),
        ),
      ),
    );
  }
}
