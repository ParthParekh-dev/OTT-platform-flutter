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
  final iDragon_data = GetStorage();
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
  void initState() {
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFC4C4C4),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_rounded),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
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

//bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color(0xFFC4C4C4),
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//               backgroundColor: Colors.teal),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//               backgroundColor: Colors.cyan),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//             backgroundColor: Colors.lightBlue,
//           ),
//         ],
//         type: BottomNavigationBarType.shifting,
//         currentIndex: _pageIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         iconSize: 40,
//         onTap: (int index) {
//           setState(
//             () {
//               print(index);
//               _pageIndex = index;
//             },
//           );
//         },
//       ),
