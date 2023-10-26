import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_host/core/global/api_response_model.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/route/app_route.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_repo/sign_up_repo.dart';
import 'package:renti_host/view/screens/auth/signup/sign_up_response_model/sign_up_response_model.dart';

class SignUpController extends GetxController {
  SignUpRepo signUpRepo;

  SignUpController({required this.signUpRepo});

  bool isSubmit = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController creditCardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController ineNumberController = TextEditingController();
  TextEditingController rfcController = TextEditingController();

  List<String> genderList = ["Male", "Female", "Others"];
  int selectedGender = 0;
  List<File> kycDocFiles = [];

  String phoneCode = "+52";

  bool isloading = false;

  void changeGender(int index) {
    selectedGender = index;
    update();
  }

  File? uploadINEOrPassport;
  File? uploadTaxStampsKey;
  File? uploadCerStampsKey;
  String ineOrPassportFileName = "";
  String taxStampKeyFileName = "";
  String cerStampKeyFileName = "";

  Future<void> pickIneOrPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadINEOrPassport = File(result.files.single.path.toString());
      // ineOrPassportFileName = result.files.single.name;

      kycDocFiles.add(uploadINEOrPassport!);
      print(kycDocFiles);

      update();
    }
  }

  Future<void> pickTaxStampsFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadTaxStampsKey = File(result.files.single.path.toString());
      taxStampKeyFileName = result.files.single.name;
      kycDocFiles.add(uploadTaxStampsKey!);

      update();
    }
  }

  Future<void> pickTaxCerFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadCerStampsKey = File(result.files.single.path.toString());
      cerStampKeyFileName = result.files.single.name;
      kycDocFiles.add(uploadCerStampsKey!);

      update();
    }
  }

  void removeIneOrPassportFile() {
    if (kycDocFiles.contains(uploadINEOrPassport)) {
      kycDocFiles.remove(uploadINEOrPassport);
      uploadINEOrPassport = null;
      ineOrPassportFileName = "";
    }

    update();
  }

  void removeTaxStampsFile() {
    if (kycDocFiles.contains(uploadTaxStampsKey)) {
      kycDocFiles.remove(uploadTaxStampsKey);
      uploadTaxStampsKey = null;
      taxStampKeyFileName = "";
    }

    // kycDocFiles.removeAt(1);
    update();
  }

  void removeTaxCerStampsFile() {
    if (kycDocFiles.contains(uploadCerStampsKey)) {
      kycDocFiles.remove(uploadCerStampsKey);
      cerStampKeyFileName = "";
      uploadCerStampsKey = null;
    }
    update();
  }

  File? imageFile;
  final imagePicker = ImagePicker();

  void openGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 120,
      maxWidth: 120,
    );

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  void openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 120, maxWidth: 120);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future<void> signUpMultipleFilesAndParams() async {
    try {
      isloading = true;
      update();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "${ApiUrlContainer.baseUrl}${ApiUrlContainer.signUpEndPoint}"),
      );

      // Add the KYC files to the request
      for (var file in kycDocFiles) {
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
          // Handle the missing file gracefully, e.g., skip it or show an error message.
        }
      }

      // Add the image file to the request
      if (imageFile != null && imageFile!.existsSync()) {
        try {
          var img = await http.MultipartFile.fromPath('image', imageFile!.path,
              contentType: MediaType('image', 'jpeg'));

          request.files.add(img);
        } on Exception catch (e) {
          print('Error adding image file to request: $e');
          // Handle the error gracefully, e.g., show an error message to the user.
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "fullName": fullNameController.text,
        "email": emailController.text,
        "phoneNumber": "$phoneCode ${phoneNumberController.text}",
        "gender": genderList[selectedGender],
        "address": addressController.text,
        "dateOfBirth":
            "${dateController.text}/${monthController.text}/${yearController.text}",
        "password": passwordController.text,
        "ine": ineNumberController.text,
        "RFC": rfcController.text,
        "role": "host"
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';

      // Send the request
      var response = await request.send();

      if (response.statusCode == 201) {
        isloading = false;
        update();
        Get.toNamed(AppRoute.kycNumberVerification);
      } else {
        print("Somethings went wrong ${response.statusCode}");
        print(
            "Somethings went wrong ${response.stream.asBroadcastStream.toString()}");
      }
    } catch (e, s) {
      print('Error sending request: $e');
      print('Error s: $s');
    }
  }
}
