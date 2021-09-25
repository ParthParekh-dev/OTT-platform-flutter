import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/screens/languageScreen.dart';
import 'package:idragon_pro/widgets/roundCornerIconButton.dart';

class GoogleLoginScreen extends StatelessWidget {
  const GoogleLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 15.0),
                    child: Image.asset('assets/namaste.png'),
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
                        Get.off(() => LanguageScreen());
                      },
                      imagePath: 'assets/google.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
