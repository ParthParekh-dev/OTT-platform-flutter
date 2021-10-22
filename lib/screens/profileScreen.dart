import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idragon_pro/constants.dart';

import 'package:get/get.dart';
import 'package:idragon_pro/screens/googleLoginScreen.dart';
import 'package:idragon_pro/screens/homeScreen.dart';
import 'package:idragon_pro/screens/mobileLoginScreen.dart';
import 'package:idragon_pro/screens/settingScreen.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';
import 'package:idragon_pro/widgets/roundCornerIconButton.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final iDragon_data;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  @override
  void initState() {
    iDragon_data = GetStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        Image.asset('assets/logo.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => SettingScreen());
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        iDragon_data.read(Constant().GOOGLE_PROFILE),
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      iDragon_data.read(Constant().GOOGLE_NAME),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  RoundCornerIconButton(
                      buttonText: 'edit'.tr,
                      width: MediaQuery.of(context).size.width * 0.3,
                      onpressed: () {},
                      imagePath: 'assets/editIcon.png'),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => MobileLoginScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              // stops: [0.0, 1.0],
                              colors: [
                                Color(0xFFD39C25),
                                Color(0xFFFBE254),
                                Color(0xFFD39C25),
                              ],
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Image.asset(
                                      'assets/vipLogo.png',
                                      width: 80,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'click_here_to_vip_login'.tr,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: RoundCornerButton(
                        buttonText: 'logout'.tr,
                        width: MediaQuery.of(context).size.width * 0.3,
                        onpressed: () {
                          Get.defaultDialog(
                              title: 'Are you sure you want to log out?',
                              middleText: '',
                              textConfirm: 'Yes',
                              textCancel: 'No',
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () {
                                _googleSignIn.signOut().then((value) {
                                  iDragon_data.write(
                                      Constant().IS_GOOGLE_LOGIN, false);
                                  Get.offAll(() => GoogleLoginScreen());
                                }).catchError((e) {});
                              });
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
