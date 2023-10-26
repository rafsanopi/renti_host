// import 'dart:convert';
// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:renti_user/core/global/api_response_model.dart';
// import 'package:renti_user/core/route/app_route.dart';
// import 'package:renti_user/view/screens/auth/sign_up/sign_up_model/sign_up_response_model.dart';
// import 'package:renti_user/view/screens/auth/sign_up/sign_up_repo/sign_up_repo.dart';

// class SignUpController extends GetxController {
//   SignUpRepo signUpRepo;
//   SignUpController({required this.signUpRepo});

//   bool isSubmit = false;

//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController monthController = TextEditingController();
//   TextEditingController yearController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController creditCardNumberController = TextEditingController();
//   TextEditingController expireDateController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();
//   TextEditingController ineNumberController = TextEditingController();

//   List<String> genderList = ["Male", "Female", "Others"];
//   int selectedGender = 0;
//   List<File> kycDocFiles = [];
//   File? profileImage;
//   String phoneCode = "+52";

//   void initialState() {
//     isSubmit = true;
//     update();

//     signUpUser();

//     isSubmit = false;
//     update();
//   }

//   Future<void> signUpUser() async {
//     ApiResponseModel responseModel = await signUpRepo.createUser(
//         fullName: fullNameController.text.toString(),
//         email: emailController.text.toString(),
//         phoneNumber: "$phoneCode ${phoneNumberController.text.toString()}",
//         gender: genderList[selectedGender],
//         address: addressController.text.toString(),
//         dateOfBirth:
//             "${dateController.text.toString()}/${monthController.text.toString()}/${yearController.text.toString()}",
//         password: passwordController.text.toString(),
//         kycImages: kycDocFiles,
//         ineNumber: ineNumberController.text.toString(),
//         profileImage: profileImage!);

//     if (responseModel.statusCode == 200) {
//       SignUpResponseModel signUpResponseModel =
//           SignUpResponseModel.fromJson(jsonDecode(responseModel.responseJson));
//       gotoNextStep(signUpResponseModel);
//     } else {}
//   }

//   void changeGender(int index) {
//     selectedGender = index;
//     update();
//   }

//   void gotoNextStep(SignUpResponseModel signUpResponseModel) {
//     Get.offAndToNamed(AppRoute.homeScreen);
//   }

//   File? uploadDrivingLicense;
//   File? uploadPassport;
//   String drivingLicenseFileName = "";
//   String passportFileName = "";

//   Future<void> pickDrivingLicenceFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         allowedExtensions: ["pdf"],
//         type: FileType.custom);

//     if (result != null && result.files.isNotEmpty) {
//       uploadDrivingLicense = File(result.files.single.name);
//       drivingLicenseFileName = result.files.single.name;

//       kycDocFiles.add(uploadDrivingLicense!);
//       update();
//     }
//   }

//   Future<void> pickPassportFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         allowedExtensions: ["pdf"],
//         type: FileType.custom);

//     if (result != null && result.files.isNotEmpty) {
//       uploadPassport = File(result.files.single.name);
//       passportFileName = result.files.single.name;
//       kycDocFiles.add(uploadPassport!);
//       update();
//     }
//   }

//   void removeDrivingLicenceFile() {
//     uploadDrivingLicense = null;
//     drivingLicenseFileName = "";
//     kycDocFiles.removeAt(0);
//     update();
//   }

//   void removePassportFile() {
//     uploadPassport = null;
//     passportFileName = "";
//     kycDocFiles.removeAt(1);
//     update();
//   }

//   File? imageFile;
//   final imagePicker = ImagePicker();
//   String? imageUrl;

//   void openGallery() async {
//     final pickedFile = await ImagePicker()
//         .pickImage(source: ImageSource.gallery, maxHeight: 120, maxWidth: 120);

//     if (pickedFile != null) {
//       imageFile = File(pickedFile.path);
//       update();
//     }
//   }

//   void openCamera(BuildContext context) async {
//     final pickedFile = await ImagePicker()
//         .pickImage(source: ImageSource.camera, maxHeight: 120, maxWidth: 120);

//     if (pickedFile != null) {
//       imageFile = File(pickedFile.path);
//       update();
//     }
//   }
// }
