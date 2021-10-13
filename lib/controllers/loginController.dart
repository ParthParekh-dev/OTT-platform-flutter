import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/screens/homeScreen.dart';
import 'package:idragon_pro/screens/languageScreen.dart';
import 'package:idragon_pro/screens/subscriptionScreen.dart';

import 'package:idragon_pro/services/networkService.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final iDragon_data = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

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

  void mobileLogin(String id, String mobile, String name, String email) async {
    isLoading(true);
    try {
      var result = await NetworkService().mobileLogin(id, mobile, name, email);

      if (result != null) {
        print(result.user.id.toString());
        Get.to(() => SubscriptionScreen());
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
}
