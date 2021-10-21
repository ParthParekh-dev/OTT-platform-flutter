import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(child: Text('Redirection to Website')),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:idragon_pro/screens/languageScreen.dart';
//
// class SubscriptionScreen extends StatefulWidget {
//   const SubscriptionScreen({Key? key}) : super(key: key);
//
//   @override
//   _SubscriptionScreenState createState() => _SubscriptionScreenState();
// }
//
// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//   int _radioSelected = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.1,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                     ),
//                   ),
//                   Image.asset('assets/logo.png'),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Icon(
//                       Icons.settings,
//                       color: Colors.black,
//                       size: 40,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _radioSelected = 1;
//                   });
//                 },
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       // gradient: LinearGradient(
//                       //   begin: Alignment.centerLeft,
//                       //   end: Alignment.centerRight,
//                       //   // stops: [0.0, 1.0],
//                       //   colors: [
//                       //     Color(0xFFD39C25),
//                       //     Color(0xFFFBE254),
//                       //     Color(0xFFD39C25),
//                       //   ],
//                       // ),
//                       color: Color(0xFFDDDDDB)),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Transform.scale(
//                             scale: 1.5,
//                             child: Radio(
//                               value: 1,
//                               groupValue: _radioSelected,
//                               activeColor: Colors.black,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _radioSelected = value as int;
//                                   // _radioVal = 'male';
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Text(
//                             'Click here to VIP login',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ]),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _radioSelected = 2;
//                   });
//                 },
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     gradient: LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       // stops: [0.0, 1.0],
//                       colors: [
//                         Color(0xFFD39C25),
//                         Color(0xFFFBE254),
//                         Color(0xFFD39C25),
//                       ],
//                     ),
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Transform.scale(
//                             scale: 1.5,
//                             child: Radio(
//                               value: 2,
//                               groupValue: _radioSelected,
//                               activeColor: Colors.black,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _radioSelected = value as int;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Text(
//                             'Click here to VIP login',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ]),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _radioSelected = 3;
//                   });
//                 },
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color(0xFFDDDDDB),
//                     // gradient: LinearGradient(
//                     //   begin: Alignment.centerLeft,
//                     //   end: Alignment.centerRight,
//                     //   // stops: [0.0, 1.0],
//                     //   colors: [
//                     //     Color(0xFFD39C25),
//                     //     Color(0xFFFBE254),
//                     //     Color(0xFFD39C25),
//                     //   ],
//                     // ),
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Transform.scale(
//                             scale: 1.5,
//                             child: Radio(
//                               value: 3,
//                               groupValue: _radioSelected,
//                               activeColor: Colors.black,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _radioSelected = value as int;
//                                   // _radioVal = 'male';
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 4,
//                           child: Text(
//                             'Click here to VIP login',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ]),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
