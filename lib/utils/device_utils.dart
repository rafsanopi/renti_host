import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renti_host/utils/app_colors.dart';

class DeviceUtils{

  static void splashUtils(){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.blueNormal,
          statusBarColor: Colors.transparent,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarDividerColor: Colors.transparent,
        )
    );
  }

  static void authUtils(){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarDividerColor: Colors.transparent,
        )
    );
  }

  static void screenUtils(){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarDividerColor: Colors.transparent,
        )
    );
  }
}