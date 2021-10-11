// To parse this JSON data, do
//
//     final mobileLoginResponse = mobileLoginResponseFromJson(jsonString);

import 'dart:convert';

MobileLoginResponse mobileLoginResponseFromJson(String str) =>
    MobileLoginResponse.fromJson(json.decode(str));

String mobileLoginResponseToJson(MobileLoginResponse data) =>
    json.encode(data.toJson());

class MobileLoginResponse {
  MobileLoginResponse({
    required this.user,
  });

  User user;

  factory MobileLoginResponse.fromJson(Map<String, dynamic> json) =>
      MobileLoginResponse(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.mobileno,
    required this.age,
    required this.email,
    required this.sGender,
    required this.sNoti,
    this.subscription,
    this.remdays,
    this.videoid,
    this.subscriptionweb,
    this.remdaysweb,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
    required this.deviceId1,
    this.deviceId2,
    required this.firebaseId1,
    this.firebaseId2,
    required this.profilePic,
    required this.isNotificationActive,
  });

  int id;
  String name;
  String lastname;
  String mobileno;
  String age;
  String email;
  String sGender;
  String sNoti;
  dynamic subscription;
  dynamic remdays;
  dynamic videoid;
  dynamic subscriptionweb;
  dynamic remdaysweb;
  String createdAt;
  String updatedAt;
  int roleId;
  String deviceId1;
  dynamic deviceId2;
  String firebaseId1;
  dynamic firebaseId2;
  String profilePic;
  String isNotificationActive;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        mobileno: json["mobileno"],
        age: json["age"],
        email: json["email"],
        sGender: json["sGender"],
        sNoti: json["sNoti"],
        subscription: json["subscription"],
        remdays: json["remdays"],
        videoid: json["videoid"],
        subscriptionweb: json["subscriptionweb"],
        remdaysweb: json["remdaysweb"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        roleId: json["role_id"],
        deviceId1: json["deviceId_1"],
        deviceId2: json["deviceId_2"],
        firebaseId1: json["firebaseId_1"],
        firebaseId2: json["firebaseId_2"],
        profilePic: json["profile_pic"],
        isNotificationActive: json["IsNotificationActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "mobileno": mobileno,
        "age": age,
        "email": email,
        "sGender": sGender,
        "sNoti": sNoti.toString(),
        "subscription": subscription,
        "remdays": remdays,
        "videoid": videoid,
        "subscriptionweb": subscriptionweb,
        "remdaysweb": remdaysweb,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "role_id": roleId,
        "deviceId_1": deviceId1,
        "deviceId_2": deviceId2,
        "firebaseId_1": firebaseId1,
        "firebaseId_2": firebaseId2,
        "profile_pic": profilePic,
        "IsNotificationActive": isNotificationActive,
      };
}
