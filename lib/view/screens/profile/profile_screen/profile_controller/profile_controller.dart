import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_model/profile_model.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_repo/profile_repo.dart';

class ProfileController extends GetxController {
  ProfileRepo profileRepo;
  ProfileController({required this.profileRepo});

  @override
  void onInit() {
    profile();
    super.onInit();
  }

  String img = "";
  ProfileModel profileModel = ProfileModel();

  bool isloading = true;
  Future<void> profile() async {
    ApiResponseModel responseModel = await profileRepo.profileRepo();

    if (responseModel.statusCode == 200) {
      profileModel =
          ProfileModel.fromJson(jsonDecode(responseModel.responseJson));
      img = profileModel.user!.image.toString();
      isloading = false;
      update();
    } else {
      Utils.toastMessage(responseModel.message);
    }
  }
}
