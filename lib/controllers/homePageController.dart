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
}
