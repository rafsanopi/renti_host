import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/auth/signin/sign_in_repo/sign_in_repo.dart';
import 'package:renti_host/view/screens/auth/signin/sign_in_response_model/sign_in_response_model.dart';

class SignInController extends GetxController {
  SignInRepo signInRepo;
  SignInController({required this.signInRepo});

  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "r@gmail.com" : "");
  TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "11223344" : "");

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool remember = false;
  bool isSubmit = false;

  //Sign In Function that call for Authentication
  Future<void> signInUser() async {
    //Is SignIn Button Clicked then value is change to True
    isSubmit = true;
    update();

    //Call Api Using ApiResponseModel That is Use for the formatting the data
    ApiResponseModel responseModel = await signInRepo.signInUser(
        email: emailController.text.toString(),
        password: passwordController.text.toString());

    if (responseModel.statusCode == 200) {
      SignInResponseModel signInResponseModel =
          SignInResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      await gotoNextStep(signInResponseModel);
    } else {
      Utils.toastMessage("Authentication failed");
    }

    isSubmit = false;
    update();
  }

  gotoNextStep(SignInResponseModel signInResponseModel) async {
    bool emailVerified =
        signInResponseModel.user?.emailVerified == false ? false : true;

    bool approved = signInResponseModel.user!.approved == false ? false : true;

    await signInRepo.apiService.sharedPreferences.setString(
        SharedPreferenceHelper.userIdKey,
        signInResponseModel.user?.id.toString() ?? "");

    await signInRepo.apiService.sharedPreferences.setString(
        SharedPreferenceHelper.accessTokenKey,
        signInResponseModel.accessToken ?? "");

    await signInRepo.apiService.sharedPreferences
        .setString(SharedPreferenceHelper.accessTokenType, "Bearer");

    // await signInRepo.apiService.sharedPreferences.setString(
    //     SharedPreferenceHelper.userEmailKey,
    //     signInResponseModel.user?.email.toString() ?? "");
    // await signInRepo.apiService.sharedPreferences.setString(
    //     SharedPreferenceHelper.userPhoneNumberKey,
    //     signInResponseModel.user?.phoneNumber.toString() ?? "");
    // await signInRepo.apiService.sharedPreferences.setString(
    //     SharedPreferenceHelper.userNameKey,
    //     signInResponseModel.user?.fullName.toString() ?? "");

    if (emailVerified == false) {
      Get.offNamed(AppRoute.forgotPasswordOTPScreen);
    }

    if (emailVerified == true && approved == true) {
      clearData();
      Get.offAllNamed(
        AppRoute.navigation,
      );
      Utils.toastMessage("Successfully Signed In");
    } else if (approved == false) {
      Utils.toastMessage("Please wait for admin approve to log in");
    } else {
      Utils.toastMessage("Enter valid Email and Password");
    }
  }

  changeRememberMe() {
    remember = !remember;
    update();
  }

  clearData() {
    remember = false;
    isSubmit = false;
    emailController.text = "";
    passwordController.text = "";
  }
}
