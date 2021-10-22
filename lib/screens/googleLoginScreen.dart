import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/loginController.dart';
import 'package:idragon_pro/widgets/roundCornerIconButton.dart';

class GoogleLoginScreen extends StatelessWidget {
  final iDragon_data = GetStorage();
  final LoginController loginController = Get.put(LoginController());

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => (loginController.isLoading.value)
            ? Container(child: Center(child: (CircularProgressIndicator())))
            : ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          'assets/logo.png',
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'welcome'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 15.0),
                            child: Image.asset(
                              'assets/namaste.png',
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ),
                          Text(
                            'Click Enter to Login',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 0.0),
                            child: Text(
                              'लॉग इन करने के लिए एंटर पर क्लिक करें',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          RoundCornerIconButton(
                              buttonText: 'Enter',
                              width: MediaQuery.of(context).size.width * 0.4,
                              onpressed: () {
                                _googleSignIn.signIn().then((userData) {
                                  print(userData!.displayName! +
                                      " " +
                                      userData.email);

                                  iDragon_data.write(
                                      Constant().IS_GOOGLE_LOGIN, true);
                                  iDragon_data.write(
                                      Constant().GOOGLE_ID, userData.id);
                                  iDragon_data.write(
                                      Constant().GOOGLE_EMAIL, userData.email);
                                  iDragon_data.write(Constant().GOOGLE_NAME,
                                      userData.displayName);
                                  iDragon_data.write(Constant().GOOGLE_PROFILE,
                                      userData.photoUrl);

                                  loginController.fetchGoogleLoginResponse(
                                      userData.displayName.toString(),
                                      userData.email,
                                      userData.photoUrl.toString());
                                }).catchError((e) {
                                  print(e);
                                });
                              },
                              imagePath: 'assets/google.png'),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
      ),
    );
  }
}
