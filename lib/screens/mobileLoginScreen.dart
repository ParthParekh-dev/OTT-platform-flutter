import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/loginController.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class MobileLoginScreen extends StatefulWidget {
  @override
  _MobileLoginScreenState createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final iDragon_data = GetStorage();
  final LoginController loginController = Get.put(LoginController());
  final myController = TextEditingController();
  var argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
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
                            child: Icon(
                              Icons.settings,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Color(0xFFFFC737),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Mobile Number',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: myController,
                        onChanged: (value) {
                          print(myController.text);
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter phone number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: RoundCornerButton(
                          buttonText: 'Log in',
                          width: MediaQuery.of(context).size.width * 0.6,
                          onpressed: () {
                            String id = iDragon_data.read(Constant().USER_ID);
                            String name =
                                iDragon_data.read(Constant().GOOGLE_NAME);
                            String email =
                                iDragon_data.read(Constant().GOOGLE_EMAIL);
                            try {
                              loginController.mobileLogin(id, myController.text,
                                  name, email, argumentData[0].toString());
                            } catch (exc) {
                              loginController.mobileLogin(
                                  id, myController.text, name, email, "000");
                            }
                          }),
                    ),
                    Obx(() => (loginController.isLoading.value)
                        ? Center(child: (CircularProgressIndicator()))
                        : Container()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
