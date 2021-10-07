import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';

import 'package:idragon_pro/screens/iDragonMain.dart';
import 'package:idragon_pro/services/networkService.dart';

class LoginController extends GetxController {
  var isLoading = true.obs;
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
        print('==========' + result.user.id.toString());
        iDragon_data.write(Constant().USER_ID, result.user.id.toString());
        iDragon_data.write(
            Constant().FIREBASE_ID, result.user.firebaseId1.toString());

        Get.to(() => IDragonMain());
      }
    } finally {
      isLoading(false);
    }
  }
}
