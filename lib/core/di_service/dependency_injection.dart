import 'package:get/get.dart';
import 'package:renti_host/service/api_service.dart';
import 'package:renti_host/view/screens/profile/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:renti_host/view/screens/profile/edit_profile/edit_profile_repo/edit_profile_repo.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_controller/profile_controller.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_repo/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDependency() async {
  final sharedPreference = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreference, fenix: true);
  Get.lazyPut(() => ApiService(sharedPreferences: Get.find()));
  Get.lazyPut(() => EditProfileController(editProfileRepo: Get.find()));
  Get.lazyPut(() => EditProfileRepo(apiService: Get.find()));
  Get.lazyPut(() => ProfileController(profileRepo: Get.find()), fenix: true);
  Get.lazyPut(() => ProfileRepo(apiService: Get.find()), fenix: true);
}
