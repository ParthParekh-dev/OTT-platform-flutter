import 'package:flutter/material.dart';
import 'package:idragon_pro/pageStructure.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
              child: Text('Search Screen'),
            ),
          ),
        ));
  }
}
