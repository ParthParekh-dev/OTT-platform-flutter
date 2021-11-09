import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/loginController.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final iDragon_data = GetStorage();
  final LoginController loginController = Get.put(LoginController());
  final myController = TextEditingController();
  final nameController = TextEditingController();
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
                        'SIGN IN',
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
                          'Enter Full Name',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: nameController,
                        onChanged: (value) {
                          print(nameController.text);
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Fullname',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Email',
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: RoundCornerButton(
                          buttonText: 'Sign in',
                          width: MediaQuery.of(context).size.width * 0.6,
                          onpressed: () {
                            if (!GetUtils.isEmail(myController.text) ||
                                nameController.text == "") {
                              Get.snackbar('Invalid email or blank name',
                                  'Please fill the details properly',
                                  backgroundColor: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              iDragon_data.write(
                                  Constant().IS_GOOGLE_LOGIN, true);

                              iDragon_data.write(
                                  Constant().GOOGLE_EMAIL, myController.text);
                              iDragon_data.write(
                                  Constant().GOOGLE_NAME, nameController.text);

                              iDragon_data.write(Constant().GOOGLE_PROFILE,
                                  'https://mtrac.in/euman/login.png');

                              try {
                                loginController.fetchGoogleLoginResponse(
                                    nameController.text,
                                    myController.text,
                                    'https://mtrac.in/euman/login.png');
                              } catch (exp) {
                                print('Exception');
                              }
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
