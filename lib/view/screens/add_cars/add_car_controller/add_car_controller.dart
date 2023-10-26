import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCarController extends GetxController {
  //Text Editing Controllers

  //AddCar Section-1
  final TextEditingController carModelName = TextEditingController();
  final TextEditingController carLicenseNumber = TextEditingController();
  final TextEditingController carDescription = TextEditingController();
  final TextEditingController carRentAmmount = TextEditingController();
  final TextEditingController insuranceStartDate = TextEditingController();
  final TextEditingController insuranceEndDate = TextEditingController();

  //AddCar Section-2
  final TextEditingController carColor = TextEditingController();
  final TextEditingController carDoor = TextEditingController();
  final TextEditingController carSeats = TextEditingController();
  final TextEditingController totalRun = TextEditingController();
  final TextEditingController gearType = TextEditingController();
  final TextEditingController registrationDate = TextEditingController();

  //String Data

  String selectedYear = "2023";
  String selectedText = "Baby Car Seat";
  String selectedCarType = "Standard";
  String selectedGearType = "Manual";

  List<File> addCarDocumentsFiles = [];
  List<File> addCarImages = [];

  File? uploadCarLic;
  File? uploadCarInsPolicy;
  File? uploadCirculationCard;
  File? uploadCarInvoice;
  File? uploadREPUVE;

  String carLicenseFileName = "";
  String carInsPolicyFillName = "";
  String circulationFillName = "";
  String carInvoiceFillName = "";
  String carREPUVEFillName = "";

  Future<void> pickCarLicFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadCarLic = File(result.files.single.path!);
      carLicenseFileName = result.files.single.name;

      addCarDocumentsFiles.add(uploadCarLic!);
      update();
    }
  }

  Future<void> pickCarLisPolicyFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadCarInsPolicy = File(result.files.single.path!);
      carInsPolicyFillName = result.files.single.name;
      addCarDocumentsFiles.add(uploadCarInsPolicy!);
      update();
    }
  }

  Future<void> pickCirculationFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadCirculationCard = File(result.files.single.path!);
      circulationFillName = result.files.single.name;
      addCarDocumentsFiles.add(uploadCirculationCard!);
      update();
    }
  }

  Future<void> pickCarInvoiceFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadCarInvoice = File(result.files.single.path!);
      carInvoiceFillName = result.files.single.name;
      addCarDocumentsFiles.add(uploadCarInvoice!);
      update();
    }
  }

  Future<void> pickREPUVEFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadREPUVE = File(result.files.single.path!);
      carREPUVEFillName = result.files.single.name;
      addCarDocumentsFiles.add(uploadREPUVE!);
      update();
    }
  }

  void removeCarLicFile() {
    uploadCarLic = null;
    carLicenseFileName = "";
    addCarDocumentsFiles.removeAt(0);
    update();
  }

  void removeCarInsPolicyFile() {
    uploadCarInsPolicy = null;
    carInsPolicyFillName = "";
    addCarDocumentsFiles.removeAt(1);
    update();
  }

  void removeCirculationFile() {
    uploadCirculationCard = null;
    circulationFillName = "";
    addCarDocumentsFiles.removeAt(2);
    update();
  }

  void removeCarInvoiceFile() {
    uploadCarInvoice = null;
    carInvoiceFillName = "";
    addCarDocumentsFiles.removeAt(3);
    update();
  }

  void removeREPUVEFile() {
    uploadREPUVE = null;
    carREPUVEFillName = "";
    addCarDocumentsFiles.removeAt(4);
    update();
  }

  File? firstImg;
  File? secondImg;
  File? thirdImg;
  final imagePicker = ImagePicker();

  void openGallery({required int index}) async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 120,
      maxWidth: 120,
    );

    if (pickedFile != null) {
      if (index == 0) {
        firstImg = File(pickedFile.path);
        addCarImages.add(firstImg!);
        update();
      } else if (index == 1) {
        secondImg = File(pickedFile.path);
        addCarImages.add(secondImg!);

        update();
      } else if (index == 2) {
        thirdImg = File(pickedFile.path);
        addCarImages.add(thirdImg!);

        update();
      }
    }
  }

  Future<void> addCarMultipleFilesAndParams() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferenceHelper.accessTokenKey);

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "${ApiUrlContainer.baseUrl}${ApiUrlContainer.carAddEndPoint}"),
      );

      // Add the KYC files to the request
      for (var file in addCarDocumentsFiles) {
        if (file.existsSync()) {
          try {
            var multipartFile = await http.MultipartFile.fromPath(
                'KYC', file.path,
                contentType: MediaType('application', 'pdf'));
            request.files.add(multipartFile);
          } on Exception catch (e) {
            print("Error is :${e.toString()}");
          }
        } else {
          print('File does not exist: ${file.path}');
        }
      }

      for (var img in addCarImages) {
        if (img.existsSync()) {
          try {
            var multipartImg = await http.MultipartFile.fromPath(
                'image', img.path,
                contentType: MediaType('image', 'jpeg'));
            request.files.add(multipartImg);
          } on Exception catch (e) {
            print("Error is :${e.toString()}");
          }
        } else {
          print('File does not exist: ${img.path}');
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "carModelName": carModelName.text,
        "year": selectedYear,
        "carLicenseNumber": carLicenseNumber.text,
        "carDescription": carDescription.text,
        "insuranceStartDate": insuranceStartDate.text,
        "insuranceEndDate": insuranceEndDate.text,
        "carColor": carColor.text,
        "carDoors": carDoor.text,
        "carSeats": carSeats.text,
        "totalRun": "${totalRun.text} km",
        "hourlyRate": carRentAmmount.text,
        "gearType": selectedGearType,
        "specialCharacteristics": selectedText,
        "registrationDate": registrationDate.text,
        "carType": selectedCarType
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var response = await request.send();

      if (response.statusCode == 201) {
        Utils.toastMessage("Successfully car added");
        Get.toNamed(AppRoute.navigation);
      } else {
        print('Response body: ${await response.stream.bytesToString()}');
        Utils.toastMessage("Somethings went wrong ${response.statusCode}");
      }
    } catch (e) {
      Utils.toastMessage("Somethings went wrong $e");
    }
  }
}
