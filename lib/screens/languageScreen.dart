import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/screens/iDragonMain.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RadioGroup(),
        ),
      ),
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
  String languageCode;
  String countryCode;
  String translation;
  LanguageList(
      {required this.name,
      required this.index,
      required this.translation,
      required this.languageCode,
      required this.countryCode});
}

class RadioGroupWidget extends State {
  // Default Radio Button Item
  String radioItem = 'English';

  // Group Value for Radio Button.
  int id = 1;

  var locale = Locale('en', 'US');

  List<LanguageList> fList = [
    LanguageList(
        index: 1,
        name: "English",
        translation: 'English',
        languageCode: 'en',
        countryCode: 'US'),
    LanguageList(
        index: 2,
        name: "Hindi",
        translation: 'हिन्दी',
        languageCode: 'hi',
        countryCode: 'IN'),
    LanguageList(
        index: 3,
        name: "Marathi",
        translation: 'मराठी',
        languageCode: 'mr',
        countryCode: 'IN'),
    // LanguageList(
    //   index: 4,
    //   name: "Bangla",
    //   translation: 'বাংলা',
    // ),
    // LanguageList(
    //   index: 5,
    //   name: "Gujarati",
    //   translation: 'ગુજરાતી',
    // ),
    LanguageList(
        index: 4,
        name: "Panjabi",
        translation: 'ਪੰਜਾਬੀ',
        languageCode: 'pa',
        countryCode: 'IN'),
    // LanguageList(
    //   index: 7,
    //   name: "Malayalam",
    //   translation: 'മലയാളം',
    // ),
    LanguageList(
        index: 5,
        name: "Tamil",
        translation: 'தமிழ்',
        languageCode: 'ta',
        countryCode: 'IN'),
    LanguageList(
        index: 6,
        name: "Telugu",
        translation: 'తెలుగు',
        languageCode: 'te',
        countryCode: 'IN'),
    LanguageList(
        index: 7,
        name: "Kannada",
        translation: 'ಕನ್ನಡ',
        languageCode: 'kn',
        countryCode: 'IN'),
    // LanguageList(
    //   index: 11,
    //   name: "Odia",
    //   translation: 'ଓଡିଆ',
    // ),
  ];

  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return Column(
      children: [
        Image.asset(
          'assets/logo.png',
          height: 80,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Select Language',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            )),
        Expanded(
          child: Container(
            child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 1.5,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: fList.map((data) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            radioItem = data.name;
                            id = data.index;
                            locale =
                                Locale(data.languageCode, data.countryCode);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: (id == data.index)
                                  ? LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.0, 1.0],
                                      colors: [
                                        Color(0xFFED0205),
                                        Color(0xFFFE8F54),
                                      ],
                                    )
                                  : null,
                              color: Color(0xFF999999),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                        "assets/lang/${data.name}.png")),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          data.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Radio(
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          hoverColor: Colors.white,
                                          groupValue: id,
                                          value: data.index,
                                          onChanged: (val) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 15.0),
                                    child: Text(data.translation),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RoundCornerButton(
              buttonText: 'Continue',
              width: MediaQuery.of(context).size.width * 0.8,
              onpressed: () {
                Get.updateLocale(locale);
                Get.offAll(() => IDragonMain());
              }),
        )
      ],
    );
  }
}
