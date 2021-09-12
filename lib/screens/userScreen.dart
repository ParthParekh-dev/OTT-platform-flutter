import 'package:flutter/material.dart';
import 'package:idragon_pro/pageStructure.dart';

class UserScreen extends StatefulWidget {
  UserScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
              child: Text('User Screen'),
            ),
          ),
        ));
  }
}
