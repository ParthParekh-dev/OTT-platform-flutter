import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/services/networkService.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  var isLoading = false.obs;
  final iDragon_data = GetStorage();

  void generateHash() async {
    isLoading(true);
    try {
      var result = await NetworkService().generateHash();

      print(result);

      if (result != null && result.status) {
        var url =
            'https://idragonpro.com/idragon/subscription_details_web/${GetStorage().read(Constant().USER_ID)}/${result.hash}';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      } else {
        Get.snackbar("Hash error", "Something went wrong",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } finally {
      isLoading(false);
    }
  }
}
