import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/device_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/button/custom_elevated_button.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';
import 'package:renti_host/view/widgets/text/custom_text.dart';

class KYCImageScreen extends StatefulWidget {
  const KYCImageScreen({super.key});

  @override
  State<KYCImageScreen> createState() => _KYCImageScreenState();
}

class _KYCImageScreenState extends State<KYCImageScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;

  fromCamera() async {
    image = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  fromGallery() async {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void initState() {
    DeviceUtils.screenUtils();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return SafeArea(
        top: true,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.blueNormal,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(text: AppStaticStrings.selectPhoto),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                physics: const BouncingScrollPhysics(),
                child: GestureDetector(
                    onTap: () {
                      controller.openGallery();
                    },
                    child: controller.imageFile == null
                        ? Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.blueNormal,
                                      width: 2,
                                      strokeAlign: 1,
                                      style: BorderStyle.solid),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: AppColors.blueLight,
                                      shape: BoxShape.circle),
                                  height: 130,
                                  width: 130,
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 50,
                                    color: AppColors.blueLightActive,
                                  ),
                                ),
                              ),
                              const CustomText(
                                top: 16,
                                text: AppStaticStrings.uploadYourPhoto,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blueNormal,
                              ),
                            ],
                          )
                        : Container(
                            height: 150,
                            width: double.infinity - 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(
                                      controller.imageFile!,
                                    ),
                                    fit: BoxFit.contain)),
                          )),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: CustomElevatedButton(
                onPressed: () {
                  controller.signUpMultipleFilesAndParams();
                },
                titleText: AppStaticStrings.continuee),
          ),
        ),
      );
    });
  }
}
