// To parse this JSON data, do
//
//     final watchlistResponse = watchlistResponseFromJson(jsonString);

import 'dart:convert';

WatchlistResponse watchlistResponseFromJson(String str) =>
    WatchlistResponse.fromJson(json.decode(str));

String watchlistResponseToJson(WatchlistResponse data) =>
    json.encode(data.toJson());

class WatchlistResponse {
  WatchlistResponse({
    required this.watchlist,
    required this.status,
  });

  List<Watchlist> watchlist;
  String status;

  factory WatchlistResponse.fromJson(Map<String, dynamic> json) =>
      WatchlistResponse(
        watchlist: List<Watchlist>.from(
            json["watchlist"].map((x) => Watchlist.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "watchlist": List<dynamic>.from(watchlist.map((x) => x.toJson())),
        "status": status,
      };
}

class Watchlist {
  Watchlist({
    required this.iUserId,
    required this.iVideoId,
    required this.name,
    required this.smallBannerUrl,
    required this.nSmallBannerUrl,
    required this.year,
  });

  int iUserId;
  int iVideoId;
  String name;
  String smallBannerUrl;
  String nSmallBannerUrl;
  String year;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        iUserId: json["iUserId"],
        iVideoId: json["iVideoId"],
        name: json["Name"],
        smallBannerUrl:
            json["SmallBannerUrl"] == null ? null : json["SmallBannerUrl"],
        nSmallBannerUrl:
            json["nSmallBannerUrl"] == null ? null : json["nSmallBannerUrl"],
        year: json["Year"],
      );

  Map<String, dynamic> toJson() => {
        "iUserId": iUserId,
        "iVideoId": iVideoId,
        "Name": name,
        "SmallBannerUrl": smallBannerUrl == null ? null : smallBannerUrl,
        "nSmallBannerUrl": nSmallBannerUrl == null ? null : nSmallBannerUrl,
        "Year": year,
      };
}
