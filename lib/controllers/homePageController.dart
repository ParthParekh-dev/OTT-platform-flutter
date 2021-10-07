import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/services/networkService.dart';

class HomePageController extends GetxController {
  var bannerList = <HomePageResponseBanner>[].obs;
  var categoryList = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchHomePage();
    super.onInit();
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
