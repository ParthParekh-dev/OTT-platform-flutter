import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/loginController.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final iDragon_data = GetStorage();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var fNameController;
    var lNameController;
    try {
      fNameController = TextEditingController(
          text: (GetStorage().read(Constant().GOOGLE_NAME))
              .toString()
              .split(' ')[0]);

      lNameController = TextEditingController(
          text: (GetStorage().read(Constant().GOOGLE_NAME))
              .toString()
              .split(' ')[1]);
    } catch (erp) {
      lNameController = TextEditingController();
    }

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
                        'edit'.tr,
                        style: TextStyle(
                            color: Color(0xFFFFC737),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: fNameController,
                        onChanged: (value) {
                          print(fNameController.text);
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter first name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: lNameController,
                        onChanged: (value) {
                          print(lNameController.text);
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter last name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: RoundCornerButton(
                          buttonText: 'Save',
                          width: MediaQuery.of(context).size.width * 0.6,
                          onpressed: () {
                            loginController.updateProfile(
                                fNameController.text, lNameController.text);
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
