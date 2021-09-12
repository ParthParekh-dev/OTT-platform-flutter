import 'package:flutter/material.dart';


class IDragonPageStructure extends StatefulWidget {
  IDragonPageStructure({required this.navigatorKey, required this.mainChild});

  final GlobalKey? navigatorKey;
  final Widget mainChild;

  @override
  _IDragonPageStructureState createState() => _IDragonPageStructureState();
}

class _IDragonPageStructureState extends State<IDragonPageStructure> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              body: widget.mainChild,
            );
          },
        );
      },
    );
  }
}
