// @dart=2.9
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:idragon_pro/screens/iDragonMain.dart';
import 'package:idragon_pro/screens/splashScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 500),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFF170829),
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
