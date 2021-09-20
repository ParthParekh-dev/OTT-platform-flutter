import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:idragon_pro/models/homePageResponse.dart';

class NetworkService {
  Future<HomePageResponse?> fetchHomePage() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://idragonpro.com/idragon/api/v.08.2021/get_home_banners?versionCode=32'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return homePageResponseFromJson(jsonString);
    } else {
      //show error
      return null;
    }
  }
}
