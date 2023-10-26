import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/user_list/user_list_repo/user_list_repo.dart';
import 'package:renti_host/view/screens/user_list/user_list_response_model/user_list_response_model.dart';

class UserListController extends GetxController {
  UserListRepo userListRepo;
  UserListController({required this.userListRepo});

  bool isLoading = false;
  List<UserList> userList = [];

  UserListResponseModel userListResponseModel = UserListResponseModel();

  Future<void> userListData() async {
    isLoading = true;
    update();

    ApiResponseModel responseModel = await userListRepo.userList();

    if (responseModel.statusCode == 200) {
      userListResponseModel = UserListResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      List<UserList>? tempList = userListResponseModel.userList;
      if(tempList != null && tempList.isNotEmpty){
        userList.addAll(tempList);
      }
      if (kDebugMode) {
        print("$userListResponseModel");
      }
    } else {
      Utils.toastMessage(responseModel.message);

    }
    isLoading = false;
    update();// Return the variable here
  }
}