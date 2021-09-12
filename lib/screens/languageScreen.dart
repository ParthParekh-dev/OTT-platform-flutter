import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
              child : Center(
                child:RadioGroup(),
              )
          )
      );
  }
}

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class LanguageList {
  String name;
  int index;
  LanguageList({required this.name, required this.index});
}

class RadioGroupWidget extends State {

  // Default Radio Button Item
  String radioItem = 'English';

  // Group Value for Radio Button.
  int id = 1;

  List<LanguageList> fList = [
    LanguageList(
      index: 1,
      name: "English",
    ),
    LanguageList(
      index: 2,
      name: "Hindi",
    ),
    LanguageList(
      index: 3,
      name: "Marathi",
    ),
    LanguageList(
      index: 4,
      name: "Bangla",
    ),
    LanguageList(
      index: 5,
      name: "Gujarati",
    ),
    LanguageList(
      index: 6,
      name: "Punjabi",
    ),
    LanguageList(
      index: 7,
      name: "Malayalam",
    ),
    LanguageList(
      index: 8,
      name: "Tamil",
    ),
    LanguageList(
      index: 9,
      name: "Telugu",
    ),
    LanguageList(
      index: 10,
      name: "Kanada",
    ),
    LanguageList(
      index: 11,
      name: "Odia",
    ),
  ];

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding : EdgeInsets.all(14.0),
            child: Text('$radioItem', style: TextStyle(fontSize: 23,color: Colors.white))
        ),

        Expanded(
            child: Container(
              // child: Column(
              //   children:
              //   fList.map((data) => Card(
              //     color: Colors.amber,
              //     child: RadioListTile(
              //       title: Text("${data.name}",style: TextStyle(color: Colors.white),),
              //       groupValue: id,
              //       value: data.index,
              //       onChanged: (val) {
              //         setState(() {
              //           radioItem = data.name ;
              //           id = data.index;
              //         });
              //       },
              //     ),
              //   )).toList(),
              // ),
              child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: <String>[
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                    'http://www.for-example.org/img/main/forexamplelogo.png',
                  ].map((String url) {
                    return GridTile(
                        child: Image.network(url, fit: BoxFit.cover));
                  }).toList()),
            ),),

      ],
    );
  }
}
