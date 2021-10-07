import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

import 'iDragonMain.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
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
                          Get.to(() => IDragonMain());
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
                        onPressed: () {
                          Get.to(() => IDragonMain());
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
              Text('LOGIN'),
              Text(
                'Enter Mobile Number',
                textAlign: TextAlign.left,
              ),
              TextField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: RoundCornerButton(
                    buttonText: 'Log in',
                    width: MediaQuery.of(context).size.width * 0.3,
                    onpressed: () {
                      Get.snackbar('Please wait', 'Coding in progress!',
                          backgroundColor: Colors.white,
                          colorText: Colors.black);
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
