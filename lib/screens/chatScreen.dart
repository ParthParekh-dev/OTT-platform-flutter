import 'package:flutter/material.dart';
import 'package:idragon_pro/pageStructure.dart';

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
              child: Text('Chat Screen'),
            ),
          ),
        ));
  }
}
