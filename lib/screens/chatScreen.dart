import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:idragon_pro/screens/languageScreen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IDragonPageStructure(
        navigatorKey: widget.navigatorKey,
        mainChild: Container(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'hello'.tr,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'message'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'subscribe'.tr,
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => LanguageScreen());
                      },
                      child: Text('Change')),
                  Text('Chat Screen'),
                ],
              ),
            ),
          ),
        ));
  }
}
