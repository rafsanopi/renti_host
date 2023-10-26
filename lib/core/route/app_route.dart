import 'package:get/get.dart';
import 'package:renti_host/view/screens/add_cars/add_car_documents/add_car_documents.dart';
import 'package:renti_host/view/screens/add_cars/add_car_screen/add_car_screen.dart';
import 'package:renti_host/view/screens/add_cars/add_car_specification/add_car_specification_screen.dart';
import 'package:renti_host/view/screens/admin_info/admin_info_screen.dart';
import 'package:renti_host/view/screens/auth/forgot/forget_password/forgot_password_screen.dart';
import 'package:renti_host/view/screens/auth/forgot/new_password/new_password.dart';
import 'package:renti_host/view/screens/auth/forgot/otp/forgot_password_otp.dart';
import 'package:renti_host/view/screens/auth/signin/sign_in_screen.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_email_verification/kyc_email_verification.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_first/kyc_screen.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_image/kyc_image_screen.dart';
import 'package:renti_host/view/screens/auth/signup/kyc/kyc_number_verification/kyc_number_verification.dart';
import 'package:renti_host/view/screens/auth/signup/signup/sign_up_screen.dart';
import 'package:renti_host/view/screens/auth/signup/signup_continue/sign_up_continue.dart';
import 'package:renti_host/view/screens/car_details/car_details_screen.dart';
import 'package:renti_host/view/screens/car_list/car_list_screen.dart';
import 'package:renti_host/view/screens/deal_information/deal_information_end_trip/end_trip_screen.dart';
import 'package:renti_host/view/screens/deal_information/deal_information_start_trip/start_trip_screen.dart';
import 'package:renti_host/view/screens/deal_information/end_trip_review/end_trip_review_screen.dart';
import 'package:renti_host/view/screens/income/income/income_screen.dart';
import 'package:renti_host/view/screens/income/weekly_income/weekly_incom_screen.dart';
import 'package:renti_host/view/screens/message/inbox/inbox_screen.dart';
import 'package:renti_host/view/screens/message/messages/messages_screen.dart';
import 'package:renti_host/view/screens/navbar/custom_navbar.dart';
import 'package:renti_host/view/screens/notification/notification_screen.dart';
import 'package:renti_host/view/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:renti_host/view/screens/profile/profile_screen/profile_screen.dart';
import 'package:renti_host/view/screens/rent_list/rent_list_screen.dart';
import 'package:renti_host/view/screens/rent_request/user_request/user_request_screen.dart';
import 'package:renti_host/view/screens/rent_request/user_request_details/user_request_details_screen.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/about_us/about_us_screen.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/renti_works_screen/renti_works_screen.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/support/support_screen.dart';
import 'package:renti_host/view/screens/rentiworks_support_condition/term_condition_screen.dart/term&condition_screen.dart';
import 'package:renti_host/view/screens/review/all_review_screen.dart';
import 'package:renti_host/view/screens/search/search_screen.dart';
import 'package:renti_host/view/screens/select_language/select_language_screen.dart';
import 'package:renti_host/view/screens/settings/change_language/change_language.dart';
import 'package:renti_host/view/screens/settings/change_password/change_password_screen.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/add_new_card/add_new_card_screen.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/card_details/card_details_screen.dart';
import 'package:renti_host/view/screens/settings/payment_method_section/payment_method/payment_method_screen.dart';
import 'package:renti_host/view/screens/settings/privacy_policy/privacy_policy_screen.dart';
import 'package:renti_host/view/screens/settings/settings/settings_screen.dart';
import 'package:renti_host/view/screens/splash/splash_screen.dart';
import 'package:renti_host/view/screens/user_list/user_list_screen.dart';

class AppRoute {
  static const String splashScreen = "/splash_screen";
  static const String selectLanguageScreen = "/select_language_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String forgotPasswordOTPScreen = "/forgot_password_otp";
  static const String newPasswordScreen = "/new_password";

  static const String signUpScreen = "/sign_up_screen";
  static const String signUpContinueScreen = "/sign_up_continue_screen";
  static const String kycScreen = "/kyc_screen";
  static const String kycImageScreen = "/kyc_upload_image";
  static const String kycNumberVerification = "/kyc_number_verification";
  static const String kycEmailVerification = "/kyc_email_verification";

  static const String navigation = "/navigation";

  //Home and Home Inner Screens Path Strings
  static const String homeScreen = "/home_screen";
  static const String searchScreen = "/search_screen";
  static const String addCarsScreens = "/add_cars_screen";
  static const String addCarsDocument = "/add_car_documents";
  static const String addCarSpecialScreens = "/add_car_special_screen";
  static const String seeAllCarList = "/car_list_screen";
  static const String carDetailsScreen = "/car_details_screen";

  //Home Drawer Screens Strings
  static const String startTripScreen = "/start_trip_screen";
  static const String endTripScreen = "/end_trip_screen";
  static const String endTripReviewScreen = "/end_trip_review_screen";
  static const String userListScreen = "/user_list_screen";
  static const String rentListScreen = "/rent_list_screen";
  static const String adminInfoScreen = "/admin_info_screen";
  static const String allReview = "/all_review_screen";
  static const String incomeScreen = "/income_screen";
  static const String weeklyIncomeScreen = "/weekly_income_screen";
  static const String settingsScreen = "/settings_screen";
  static const String changeLanguageScreen = "/change_language_screen";
  static const String changePasswordScreen = "/change_password_screen";
  static const String paymentMethodScreen = "/payment_method_screen";
  static const String addNewCardScreen = "/add_debit_card_screen";
  static const String cardDetailsScreen = "/card_details_screen";
  static const String privacyPolicyScreen = "/privacy_policy_screen";
  static const String howRentiWorks = "/renti_work_screen";
  static const String termsAndCondition = "/terms_condition_screen";
  static const String notificationScreen = "/notification_screen";

  //Rent Request and Inner Screens Path Strings
  static const String rentScreen = "/user_request_screen";
  static const String userRequestDetails = "/user_request_details_screen";
  static const String supportScreen = "/support_screen";
  static const String aboutUs = "/about_us_screen";

  //Message and Inner Screens Path Strings
  static const String messageScreen = "/message_screen";
  static const String inboxScreen = "/inbox_screen";

  static const String profileScreen = "/profile_screen";
  static const String editProfileScreen = "/edit_profile_screen";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: selectLanguageScreen, page: () => const SelectLanguageScreen()),
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(
        name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: forgotPasswordOTPScreen, page: () => const ForgotPassOTP()),
    GetPage(name: newPasswordScreen, page: () => const NewPasswordScreen()),

    GetPage(name: signUpScreen, page: () => const SignUpScreen()),
    GetPage(
        name: signUpContinueScreen, page: () => const SignUpContinueScreen()),
    GetPage(name: kycScreen, page: () => const KYCScreen()),
    GetPage(name: kycImageScreen, page: () => const KYCImageScreen()),
    GetPage(
        name: kycNumberVerification, page: () => const KYCNumberVerification()),
    GetPage(
        name: kycEmailVerification, page: () => const KYCEmailVerification()),

    GetPage(name: navigation, page: () => const CustomNavBar()),

    //Home and Inner Screens
    //GetPage(name: homeScreen, page: () =>  HomeScreen(image: "")),
    GetPage(name: searchScreen, page: () => const SearchScreen()),
    GetPage(name: addCarsScreens, page: () => const AddCarsScreen()),
    GetPage(name: addCarsDocument, page: () => const AddCarDocuments()),
    GetPage(name: addCarSpecialScreens, page: () => const AddCarSpecialScreen()),
    GetPage(name: seeAllCarList, page: () => const CarListScreen()),
    GetPage(name: carDetailsScreen, page: () => const CarDetailsScreen()),
    GetPage(name: userListScreen, page: () => const UserListScreen()),

    //Home Drawer Screens
    GetPage(name: startTripScreen, page: () => const StartTripScreen()),
    GetPage(name: endTripScreen, page: () => const EndTripScreen()),
    GetPage(name: endTripReviewScreen, page: () => const EndTripReviewScreen()),
    GetPage(name: rentListScreen, page: () => const RentListScreen()),
    GetPage(name: adminInfoScreen, page: () => const AdminInfoScreen()),
    GetPage(name: allReview, page: () => const AllReviewScreen()),
    GetPage(name: incomeScreen, page: () => const IncomeScreen()),
    GetPage(name: weeklyIncomeScreen, page: () => const WeeklyIncomeScreen()),
    GetPage(name: settingsScreen, page: () => const SettingsScreen()),
    GetPage(
        name: changeLanguageScreen, page: () => const ChangeLanguageScreen()),
    GetPage(
        name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: paymentMethodScreen, page: () => const PaymentMethodScreen()),
    GetPage(name: addNewCardScreen, page: () => const AddNewCardScreen()),
    GetPage(name: cardDetailsScreen, page: () => const CardDetailsScreen()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: howRentiWorks, page: () => const RentiWorkScreen()),
    GetPage(name: termsAndCondition, page: () => const TermsConditionScreen()),
    GetPage(name: supportScreen, page: () => const SupportScreen()),
    GetPage(name: aboutUs, page: () => const AboutUsScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),

    //Rent Request and Inner Screens
    GetPage(name: rentScreen, page: () => const UserRequestScreen()),
    GetPage(
        name: userRequestDetails, page: () => const UserRequestDetailsScreen()),

    //Message and Inner Screens
    GetPage(name: messageScreen, page: () => const MessageScreen()),
    GetPage(name: inboxScreen, page: () => const InboxScreen()),

    //Profile and inner Screens
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
  ];
}
