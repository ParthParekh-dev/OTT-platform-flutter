// To parse this JSON data, do
//
//     final hashResponse = hashResponseFromJson(jsonString);

import 'dart:convert';

HashResponse hashResponseFromJson(String str) =>
    HashResponse.fromJson(json.decode(str));

String hashResponseToJson(HashResponse data) => json.encode(data.toJson());

class HashResponse {
  HashResponse({
    required this.status,
    required this.message,
    required this.hash,
  });

  bool status;
  String message;
  String hash;

  factory HashResponse.fromJson(Map<String, dynamic> json) => HashResponse(
        status: json["status"],
        message: json["message"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "hash": hash,
      };
}
