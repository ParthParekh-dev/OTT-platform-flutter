// To parse this JSON data, do
//
//     final userDetailsResponse = userDetailsResponseFromJson(jsonString);

import 'dart:convert';

UserDetailsResponse userDetailsResponseFromJson(String str) =>
    UserDetailsResponse.fromJson(json.decode(str));

String userDetailsResponseToJson(UserDetailsResponse data) =>
    json.encode(data.toJson());

class UserDetailsResponse {
  UserDetailsResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  bool status;
  String message;
  User user;

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailsResponse(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
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
    required this.subscriptions,
    required this.daysdiff,
    required this.timediff,
    required this.subscriptionsWeb,
    required this.daysdiffWeb,
    required this.timediffWeb,
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
  Subscriptions? subscriptions;
  int daysdiff;
  int timediff;
  Subscriptions? subscriptionsWeb;
  int daysdiffWeb;
  int timediffWeb;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        mobileno: json["mobileno"],
        age: json["age"],
        email: json["email"],
        sGender: json["sGender"],
        sNoti: (json["sNoti"]),
        subscription: json["subscription"],
        remdays: json["remdays"],
        videoid: json["videoid"],
        subscriptionweb: json["subscriptionweb"],
        remdaysweb: json["remdaysweb"],
        createdAt: (json["created_at"]),
        updatedAt: (json["updated_at"]),
        roleId: json["role_id"],
        deviceId1: json["deviceId_1"],
        deviceId2: json["deviceId_2"],
        firebaseId1: json["firebaseId_1"],
        firebaseId2: json["firebaseId_2"],
        profilePic: json["profile_pic"],
        isNotificationActive: json["IsNotificationActive"],
        subscriptions: json["subscriptions"] == null
            ? null
            : Subscriptions.fromJson(json["subscriptions"]),
        daysdiff: json["daysdiff"],
        timediff: json["timediff"],
        subscriptionsWeb: json["subscriptions_web"] == null
            ? null
            : Subscriptions.fromJson(json["subscriptions_web"]),
        daysdiffWeb: json["daysdiff_web"],
        timediffWeb: json["timediff_web"],
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
        "subscriptions": subscriptions?.toJson(),
        "daysdiff": daysdiff,
        "timediff": timediff,
        "subscriptions_web": subscriptionsWeb?.toJson(),
        "daysdiff_web": daysdiffWeb,
        "timediff_web": timediffWeb,
      };
}

class Subscriptions {
  Subscriptions({
    required this.id,
    required this.iUserId,
    required this.sAmount,
    required this.packageId,
    required this.sType,
    required this.iVideoId,
    required this.sTransId,
    required this.sRazorPayId,
    required this.sStatus,
    this.sPaytmResponse,
    this.sPaytmId,
    this.sSeason,
    required this.sSubscribedFrom,
    required this.comment,
    this.statusId,
    this.statusName,
    this.createdById,
    this.modifiedById,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isActive,
    this.deactivateReason,
    this.deactivatedAt,
    this.pgId,
    this.paymentResponse,
    required this.package,
  });

  int id;
  int iUserId;
  String sAmount;
  String packageId;
  String sType;
  int iVideoId;
  String sTransId;
  String sRazorPayId;
  String sStatus;
  dynamic sPaytmResponse;
  dynamic sPaytmId;
  dynamic sSeason;
  String sSubscribedFrom;
  String comment;
  dynamic statusId;
  dynamic statusName;
  dynamic createdById;
  dynamic modifiedById;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String isActive;
  dynamic deactivateReason;
  dynamic deactivatedAt;
  dynamic pgId;
  dynamic paymentResponse;
  String package;

  factory Subscriptions.fromJson(Map<String, dynamic> json) => Subscriptions(
        id: json["id"],
        iUserId: json["iUserId"],
        sAmount: json["sAmount"],
        packageId: json["packageId"],
        sType: json["sType"],
        iVideoId: json["iVideoId"],
        sTransId: json["sTransId"],
        sRazorPayId: json["sRazorPayId"],
        sStatus: json["sStatus"],
        sPaytmResponse: json["sPaytmResponse"],
        sPaytmId: json["sPaytmId"],
        sSeason: json["sSeason"],
        sSubscribedFrom: (json["sSubscribedFrom"]),
        comment: json["comment"],
        statusId: json["StatusId"],
        statusName: json["StatusName"],
        createdById: json["CreatedById"],
        modifiedById: json["ModifiedById"],
        createdAt: (json["created_at"]),
        updatedAt: (json["updated_at"]),
        deletedAt: json["deleted_at"],
        isActive: json["isActive"],
        deactivateReason: json["deactivateReason"],
        deactivatedAt: json["deactivated_at"],
        pgId: json["pg_id"],
        paymentResponse: json["payment_response"],
        package: json["Package"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iUserId": iUserId,
        "sAmount": sAmount,
        "packageId": packageId,
        "sType": sType,
        "iVideoId": iVideoId,
        "sTransId": sTransId,
        "sRazorPayId": sRazorPayId,
        "sStatus": sStatus,
        "sPaytmResponse": sPaytmResponse,
        "sPaytmId": sPaytmId,
        "sSeason": sSeason,
        "sSubscribedFrom": sSubscribedFrom.toString(),
        "comment": comment,
        "StatusId": statusId,
        "StatusName": statusName,
        "CreatedById": createdById,
        "ModifiedById": modifiedById,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "deleted_at": deletedAt,
        "isActive": isActive,
        "deactivateReason": deactivateReason,
        "deactivated_at": deactivatedAt,
        "pg_id": pgId,
        "payment_response": paymentResponse,
        "Package": package,
      };
}
