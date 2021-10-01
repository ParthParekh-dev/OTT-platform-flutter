import 'package:get/get.dart';
import 'package:idragon_pro/models/searchResponse.dart';
import 'package:idragon_pro/services/networkService.dart';

class SearchController extends GetxController {
  var searchResult = <Search>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchSearchResponse(String search) async {
    isLoading(true);
    try {
      var result = await NetworkService().fetchSearchResponse(search);

      if (result != null && result.search.length != 0) {
        searchResult.value = result.search;
      }
    } finally {
      isLoading(false);
    }
  }
}
