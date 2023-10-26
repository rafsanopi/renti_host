import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/%20home/home_model/home_carlist_model.dart';
import 'package:renti_host/view/screens/%20home/home_repo/home_carlist_repo.dart';

class HomeCarListController extends GetxController {
  HomeCarListRepo homeCarListRepo;
  HomeCarListController({required this.homeCarListRepo});

  bool isLoading = true;

  TextEditingController searchController = TextEditingController();
  HomeCarListModel homeCarListModel = HomeCarListModel();

  Future<void> homeCarList({String search = ""}) async {
    ApiResponseModel responseModel =
        await homeCarListRepo.homeCarList(search: search);

    if (responseModel.statusCode == 200) {
      isLoading = false;
      homeCarListModel =
          HomeCarListModel.fromJson(jsonDecode(responseModel.responseJson));
      update();
    } else {
      Utils.toastMessage(responseModel.message);
    }
  }

  @override
  void onInit() {
    homeCarList();
    super.onInit();
  }
}
