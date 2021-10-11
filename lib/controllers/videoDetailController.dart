import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/models/videoDetailResponse.dart';
import 'package:idragon_pro/services/networkService.dart';

class VideoDetailController extends GetxController {
  var videoDetails = Rxn<Video>();
  var isLoading = true.obs;
  var addingToWatchList = false.obs;
  var videoPlayerReady = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchVideoDetails(String id) async {
    isLoading(true);
    try {
      var result = await NetworkService().fetchVideoDetails(id);
      if (result != null) {
        videoDetails.value = result.video;
      }
    } finally {
      isLoading(false);
    }
  }

  void addToWatchlist(String userId, String videoId) async {
    addingToWatchList(true);
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
    } finally {
      addingToWatchList(false);
    }
  }
}
