import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/screens/languageScreen.dart';
import 'package:idragon_pro/screens/profileScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:idragon_pro/services/networkService.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final iDragon_data = GetStorage();

  void fetchGoogleLoginResponse(
      String name, String email, String profile) async {
    isLoading(true);
    try {
      var result =
          await NetworkService().fetchGoogleLoginResponse(name, email, profile);

      if (result != null) {
        print(result.user.id.toString());
        iDragon_data.write(Constant().USER_ID, result.user.id.toString());
        iDragon_data.write(
            Constant().FIREBASE_ID, result.user.firebaseId1.toString());

        Get.offAll(() => LanguageScreen());
      }
    } finally {
      isLoading(false);
    }
  }

  void mobileLogin(String id, String mobile, String name, String email,
      String videoId) async {
    isLoading(true);
    try {
      var result = await NetworkService().mobileLogin(id, mobile, name, email);

      if (result != null) {
        print(result.user.id.toString());
        GetStorage().write(Constant().IS_MOBILE_LOGIN, true);
        GetStorage().write(Constant().USER_MOBILE, mobile);
        var url =
            'https://idragonpro.com/idragon/web_razor_payment_form/${GetStorage().read(Constant().USER_ID)}/$videoId';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      } else {
        Get.snackbar("Please enter valid phone number", "Something went wrong",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } finally {
      isLoading(false);
    }
  }

  void updateProfile(String fname, String lname) async {
    isLoading(true);
    try {
      var result = await NetworkService().updateProfile(fname, lname);

      if (result != null) {
        GetStorage().write(Constant().GOOGLE_NAME, fname + ' ' + lname);
        Get.off(() => ProfileScreen());
      } else {
        Get.snackbar("Please enter valid input", "Something went wrong",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } finally {
      isLoading(false);
    }
  }
}
