import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_host/core/global/api_url_container.dart';
import 'package:renti_host/core/helper/shear_preference_helper.dart';
import 'package:renti_host/utils/app_utils.dart';
import 'package:renti_host/view/screens/profile/edit_profile/edit_profile_repo/edit_profile_repo.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_controller/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
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

  EditProfileRepo editProfileRepo;
  EditProfileController({required this.editProfileRepo});
  TextEditingController emailController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController creaditCardNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  Future<void> editProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString(SharedPreferenceHelper.userIdKey);
    String? token = prefs.getString(SharedPreferenceHelper.accessTokenKey);

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "${ApiUrlContainer.baseUrl}${ApiUrlContainer.editProfile}$userID"),
      );

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
        "email": emailController.text,
        "fullName": fullNameController.text,
        "phoneNumber": phoneNumberController.text,
        "image": "",
        "address": addressController.text,
        "dateOfBirth": dateOfBirthController.text,
        "creaditCardNumber": creaditCardNumberController.text,
        "gender": genderController.text
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        final profileController = Get.find<ProfileController>();
        profileController.profile();
        Utils.toastMessage("Successfully Data Updated");
        navigator!.pop();
      } else {
        Utils.toastMessage("Somethings went wrong ${response.statusCode}");
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }
}
