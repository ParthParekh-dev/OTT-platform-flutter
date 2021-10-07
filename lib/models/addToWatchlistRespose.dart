import 'dart:convert';

AddtoWatchlistResponse addtoWatchlistResponseFromJson(String str) =>
    AddtoWatchlistResponse.fromJson(json.decode(str));

String addtoWatchlistResponseToJson(AddtoWatchlistResponse data) =>
    json.encode(data.toJson());

class AddtoWatchlistResponse {
  AddtoWatchlistResponse({
    required this.watchlist,
    required this.status,
  });

  Watchlist watchlist;
  String status;

  factory AddtoWatchlistResponse.fromJson(Map<String, dynamic> json) =>
      AddtoWatchlistResponse(
        watchlist: Watchlist.fromJson(json["watchlist"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "watchlist": watchlist.toJson(),
        "status": status,
      };
}

class Watchlist {
  Watchlist({
    required this.iUserId,
    required this.iVideoId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String iUserId;
  String iVideoId;
  String updatedAt;
  String createdAt;
  int id;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        iUserId: json["iUserId"],
        iVideoId: json["iVideoId"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iUserId": iUserId,
        "iVideoId": iVideoId,
        "updated_at": updatedAt.toString(),
        "created_at": createdAt.toString(),
        "id": id,
      };
}
