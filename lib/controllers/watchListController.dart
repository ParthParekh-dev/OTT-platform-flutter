import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/models/watchListResponse.dart';
import 'package:idragon_pro/services/networkService.dart';

class WatchListController extends GetxController {
  var isLoading = true.obs;
  final iDragon_data = GetStorage();
  var watchList = <Watchlist>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchWatchList(String id) async {
    isLoading(true);
    try {
      var result = await NetworkService().fetchWatchList(id);

      if (result != null) {
        watchList.value = result.watchlist;
      }
    } finally {
      isLoading(false);
    }
  }
}
