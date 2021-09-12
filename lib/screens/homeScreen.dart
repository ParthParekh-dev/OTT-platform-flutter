import 'package:flutter/material.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';
import 'package:idragon_pro/widgets/roundCornerIconButton.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: Text('Home Screen'),
            ),
          ),
        ));
  }
}
