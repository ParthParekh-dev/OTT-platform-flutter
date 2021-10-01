import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/screens/googleLoginScreen.dart';
import 'package:idragon_pro/screens/languageScreen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

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
    return IDragonPageStructure(
      navigatorKey: widget.navigatorKey,
      mainChild: Container(
        child: Center(
          child: Column(
            children: [
              Text(iDragon_data.read(Constant().GOOGLE_NAME)),
              Text(iDragon_data.read(Constant().GOOGLE_EMAIL)),
              Image.network(iDragon_data.read(Constant().GOOGLE_PROFILE)),
              ElevatedButton(
                  onPressed: () {
                    _googleSignIn.signOut().then((value) {
                      iDragon_data.write(Constant().IS_GOOGLE_LOGIN, false);
                      Get.offAll(() => GoogleLoginScreen());
                    }).catchError((e) {});
                  },
                  child: Text('Log Out'))
            ],
          ),
        ),
      ),
    );
  }
}
