// To parse this JSON data, do
//
//     final promoResponse = promoResponseFromJson(jsonString);

import 'dart:convert';

PromoResponse promoResponseFromJson(String str) =>
    PromoResponse.fromJson(json.decode(str));

String promoResponseToJson(PromoResponse data) => json.encode(data.toJson());

class PromoResponse {
  PromoResponse({
    required this.promoflash,
  });

  Promoflash promoflash;

  factory PromoResponse.fromJson(Map<String, dynamic> json) => PromoResponse(
        promoflash: Promoflash.fromJson(json["promoflash"]),
      );

  Map<String, dynamic> toJson() => {
        "promoflash": promoflash.toJson(),
      };
}

class Promoflash {
  Promoflash({
    required this.id,
    this.file,
    required this.promoVideo,
    this.file2,
    required this.flashVideoUrl,
    required this.flashTime,
    required this.paymentAudioUrl,
    required this.enablePaymentFlashVideo,
    this.statusId,
    this.statusName,
    this.createdById,
    this.modifiedById,
    this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  dynamic file;
  String promoVideo;
  dynamic file2;
  String flashVideoUrl;
  String flashTime;
  String paymentAudioUrl;
  String enablePaymentFlashVideo;
  dynamic statusId;
  dynamic statusName;
  dynamic createdById;
  dynamic modifiedById;
  dynamic createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Promoflash.fromJson(Map<String, dynamic> json) => Promoflash(
        id: json["id"],
        file: json["file"],
        promoVideo: json["PromoVideo"],
        file2: json["file2"],
        flashVideoUrl: json["FlashVideoURL"],
        flashTime: json["FlashTime"],
        paymentAudioUrl: json["PaymentAudioUrl"],
        enablePaymentFlashVideo: json["EnablePaymentFlashVideo"],
        statusId: json["StatusId"],
        statusName: json["StatusName"],
        createdById: json["CreatedById"],
        modifiedById: json["ModifiedById"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "PromoVideo": promoVideo,
        "file2": file2,
        "FlashVideoURL": flashVideoUrl,
        "FlashTime": flashTime,
        "PaymentAudioUrl": paymentAudioUrl,
        "EnablePaymentFlashVideo": enablePaymentFlashVideo,
        "StatusId": statusId,
        "StatusName": statusName,
        "CreatedById": createdById,
        "ModifiedById": modifiedById,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
