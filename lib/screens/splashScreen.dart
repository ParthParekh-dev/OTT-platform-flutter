import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/screens/googleLoginScreen.dart';

import 'iDragonMain.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    final iDragon_data = GetStorage();

    if (iDragon_data.read(Constant().IS_LOGIN) == null) {
      iDragon_data.write(Constant().IS_LOGIN, false);
    }
    Get.off(() => iDragon_data.read(Constant().IS_LOGIN)
        ? IDragonMain()
        : GoogleLoginScreen());
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
