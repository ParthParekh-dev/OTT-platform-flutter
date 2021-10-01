import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/models/promoResponse.dart';
import 'package:idragon_pro/models/searchResponse.dart';
import 'package:idragon_pro/models/videoDetailResponse.dart';

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

  Future<PromoResponse?> fetchPromoVideo() async {
    http.Response response = await http.get(
      Uri.parse('https://idragonpro.com/idragon/api/v.08.2021/promoflash'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      var jsonString = response.body;
      return promoResponseFromJson(jsonString);
    } else {
      //show error
      return null;
    }
  }

  Future<VideoDetailResponse?> fetchVideoDetails(String id) async {
    http.Response response = await http.post(
      Uri.parse(
          'https://idragonpro.com/idragon/api/v.08.2021/getvideobyid_new?id=$id&versionCode=32'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return videoDetailResponseFromJson(jsonString);
    } else {
      //show error
      return null;
    }
  }

  Future<SearchResponse?> fetchSearchResponse(String text) async {
    http.Response response = await http.post(
      Uri.parse(
          'https://idragonpro.com/idragon/api/v.08.2021/getsearchitems?search=$text'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = response.body;

      return searchResponseFromJson(jsonString);
    } else {
      //show error
      return null;
    }
  }
}
