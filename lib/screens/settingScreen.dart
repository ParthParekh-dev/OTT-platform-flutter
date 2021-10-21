import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Movie Subscription',
                    style: TextStyle(fontSize: 16),
                  ),
                  RoundCornerButton(
                      buttonText: 'NO ACTIVE SUBSCRIPTION',
                      width: MediaQuery.of(context).size.width * 0.7,
                      onpressed: () {}),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'WebSeries Subscription',
                    style: TextStyle(fontSize: 16),
                  ),
                  RoundCornerButton(
                      buttonText: 'NO ACTIVE SUBSCRIPTION',
                      width: MediaQuery.of(context).size.width * 0.7,
                      onpressed: () {}),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notification Setting'),
                      Switch(
                        onChanged: toggleSwitch,
                        value: isSwitched,
                        activeColor: Colors.blue,
                        activeTrackColor: Colors.yellow,
                        inactiveThumbColor: Colors.redAccent,
                        inactiveTrackColor: Colors.orange,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('English'),
                      RoundCornerButton(
                          buttonText: 'Change', width: 150, onpressed: () {}),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Help and FAQs',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Contact Idragon Team'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Text'), Text('support@idragonpro.com')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Contact'), Text('Whatsapp 9987714307')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Customer Support'),
                      Text('+91 9819325845')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
