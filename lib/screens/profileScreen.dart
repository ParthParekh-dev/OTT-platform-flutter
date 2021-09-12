import 'package:flutter/material.dart';
import 'package:idragon_pro/pageStructure.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              child: Text('Profile Screen'),
            ),
          ),
        ));
  }
}
