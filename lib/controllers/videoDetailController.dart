import 'package:get/get.dart';
import 'package:idragon_pro/models/videoDetailResponse.dart';
import 'package:idragon_pro/services/networkService.dart';

class VideoDetailController extends GetxController {
  var videoDetails = Rxn<Video>();
  var isLoading = true.obs;

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
}
