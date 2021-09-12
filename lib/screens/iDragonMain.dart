import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/screens/chatScreen.dart';
import 'package:idragon_pro/screens/homeScreen.dart';
import 'package:idragon_pro/screens/profileScreen.dart';
import 'package:idragon_pro/screens/searchScreen.dart';
import 'package:idragon_pro/screens/userScreen.dart';

class IDragonMain extends StatefulWidget {
  @override
  _IDragonMainState createState() => _IDragonMainState();
}

class _IDragonMainState extends State<IDragonMain> {
  final euman_data = GetStorage();
  int _pageIndex = 0;

  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
    4: GlobalKey(),
    5: GlobalKey(),
  };

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return !await Navigator.maybePop(
                navigatorKeys[_pageIndex]!.currentState!.context);
          },
          child: IndexedStack(
            index: _pageIndex,
            children: <Widget>[
              HomeScreen(
                navigatorKey: navigatorKeys[0],
              ),
              UserScreen(
                navigatorKey: navigatorKeys[1],
              ),
              SearchScreen(
                navigatorKey: navigatorKeys[2],
              ),
              ChatScreen(
                navigatorKey: navigatorKeys[3],
              ),
              ProfileScreen(
                navigatorKey: navigatorKeys[4],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFFC4C4C4),
        activeColor: Color(0xFFF70004),
        color: Colors.black,
        style: TabStyle.reactCircle,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.videocam_rounded, title: 'Video'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.chat, title: 'Chat'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _pageIndex,
        onTap: (int index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
    );
  }
}
