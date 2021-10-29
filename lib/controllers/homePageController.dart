import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/models/userDetailsReponse.dart';
import 'package:idragon_pro/services/networkService.dart';

class HomePageController extends GetxController {
  var bannerList = <HomePageResponseBanner>[].obs;
  var categoryList = <Category>[].obs;
  var isLoading = true.obs;
  var userDetails = Rxn<User>();

  @override
  void onInit() {
    fetchHomePage();
    fetchUserDetails();
    super.onInit();
  }

  void fetchUserDetails() async {
    isLoading(true);
    try {
      var result = await NetworkService().fetchUserDetails();
      if (result != null) {
        if (result.status == true) {
          userDetails.value = result.user;
          print(userDetailsResponseToJson(result));

          if (result.user.subscriptions != null &&
              result.user.timediff != null &&
              result.user.daysdiff != null) {
            if ((result.user.daysdiff > 0 || result.user.timediff > 0)) {
              GetStorage().write(Constant().IS_MOVIE_SUBS, true);
            } else {
              GetStorage().write(Constant().IS_MOVIE_SUBS, false);
            }
          } else {
            GetStorage().write(Constant().IS_MOVIE_SUBS, false);
          }
          if (result.user.subscriptionsWeb != null &&
              result.user.timediffWeb != null &&
              result.user.daysdiffWeb != null) {
            if ((result.user.daysdiffWeb > 0 || result.user.timediffWeb > 0)) {
              GetStorage().write(Constant().IS_WEB_SUBS, true);
            } else {
              GetStorage().write(Constant().IS_WEB_SUBS, false);
            }
          } else {
            GetStorage().write(Constant().IS_WEB_SUBS, false);
          }
        } else {
          GetStorage().write(Constant().IS_MOVIE_SUBS, false);
          GetStorage().write(Constant().IS_WEB_SUBS, false);
        }
      } else {
        GetStorage().write(Constant().IS_MOVIE_SUBS, false);
        GetStorage().write(Constant().IS_WEB_SUBS, false);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchHomePage() async {
    isLoading(true);
    try {
      var homePage = await NetworkService().fetchHomePage();
      if (homePage != null) {
        bannerList.value = homePage.banners;
        categoryList.value = homePage.categories;
      }
    } finally {
      isLoading(false);
    }
  }

  void addToWatchlist(String userId, String videoId) async {
    try {
      var result = await NetworkService().addtoWatchList(userId, videoId);
      if (result != null) {
        Get.snackbar("Added to watchlist", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      } else {
        Get.snackbar("Already added to watchlist", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } finally {}
  }
}
