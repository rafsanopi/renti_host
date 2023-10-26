import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/language/languages.dart';
import 'core/di_service/dependency_injection.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependency();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      translations: Languages(),
      locale: const Locale("en" , "US"),
      fallbackLocale: const Locale("en" , "US"),
      initialRoute: AppRoute.splashScreen,
      navigatorKey: Get.key,
      getPages: AppRoute.routes,
    );
  }
}