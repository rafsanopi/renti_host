import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/utils/app_colors.dart';
import 'package:renti_host/utils/app_static_strings.dart';
import 'package:renti_host/utils/device_utils.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_first/inner_widgets/kyc_auth_section.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_controller/sign_up_controller.dart';
import 'package:renti_host/view/widgets/appbar/custom_appbar.dart';
import 'package:renti_host/view/widgets/back/custom_back.dart';
import 'package:renti_host/view/widgets/container/custon_container.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => SafeArea(
        top: true,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.blueNormal,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(text: AppStaticStrings.kyc),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24),
                physics: BouncingScrollPhysics(),
                child: KYCAuthSection(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
