import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idragon_pro/constants.dart';

import 'package:get/get.dart';
import 'package:idragon_pro/screens/googleLoginScreen.dart';
import 'package:idragon_pro/screens/homeScreen.dart';
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
                    height: MediaQuery.of(context).size.height * 0.1,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: IconButton(
                            onPressed: () {},
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
                      buttonText: 'Edit',
                      width: MediaQuery.of(context).size.width * 0.3,
                      onpressed: () {},
                      imagePath: 'assets/editIcon.png'),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/login_rect.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: Image.asset(
                                'assets/vipLogo.png',
                                width: 80,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Click here to VIP login',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: RoundCornerButton(
                        buttonText: 'Log out',
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
