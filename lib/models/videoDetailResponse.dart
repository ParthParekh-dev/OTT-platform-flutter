import 'dart:convert';

VideoDetailResponse videoDetailResponseFromJson(String str) =>
    VideoDetailResponse.fromJson(json.decode(str));

String videoDetailResponseToJson(VideoDetailResponse data) =>
    json.encode(data.toJson());

class VideoDetailResponse {
  VideoDetailResponse({
    required this.video,
    required this.status,
  });

  Video video;
  String status;

  factory VideoDetailResponse.fromJson(Map<String, dynamic> json) =>
      VideoDetailResponse(
        video: Video.fromJson(json["video"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "video": video.toJson(),
        "status": status,
      };
}

class Video {
  Video({
    required this.id,
    required this.videoType,
    required this.language,
    required this.category,
    required this.season,
    required this.episode,
    required this.name,
    required this.time,
    required this.year,
    required this.genre,
    required this.geographicalArea,
    required this.tags,
    required this.starCast,
    required this.sDirector,
    required this.synopsis,
    required this.bigBannerUrl,
    required this.smallBannerUrl,
    this.infoBannerUrl,
    required this.trailerUrl,
    required this.videoUrl,
    required this.comingSoon,
    required this.isFree,
    required this.videoStatus,
    this.showonSliders,
    required this.sliderPosition,
    required this.bannerOrder,
    this.statusId,
    this.statusName,
    this.createdById,
    this.modifiedById,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.s1080JobId,
    required this.s1080VideoUrl,
    required this.s720JobId,
    required this.s720VideoUrl,
    required this.s480JobId,
    required this.s480VideoUrl,
    required this.i1080Completed,
    required this.i720Completed,
    required this.i480Completed,
    this.sVideoJobId,
    required this.sShowOnHome,
    required this.sShowOnMovies,
    required this.sShowOnSeries,
    required this.sShowOnKids,
    required this.s1080TJobId,
    required this.s1080TrailorUrl,
    required this.s720TJobId,
    required this.s720TrailorUrl,
    required this.s480TJobId,
    required this.s480TrailorUrl,
    required this.i1080TCompleted,
    required this.i720TCompleted,
    required this.i480TCompleted,
    this.sTrailorJobId,
    required this.sAllowedInPackage,
    required this.tagPosition,
    required this.nBigBannerUrl,
    required this.nSmallBannerUrl,
    this.nSubscriptionBannerUrl,
    required this.tagUrl,
    this.subscriptions,
    this.movieprices,
    required this.packages,
    required this.paymentGateways,
  });

  int id;
  String videoType;
  String language;
  String category;
  String season;
  String episode;
  String name;
  String time;
  String year;
  List<String> genre;
  List<String> geographicalArea;
  List<String> tags;
  List<String> starCast;
  String sDirector;
  String synopsis;
  String bigBannerUrl;
  String smallBannerUrl;
  dynamic infoBannerUrl;
  String trailerUrl;
  String videoUrl;
  String comingSoon;
  String isFree;
  String videoStatus;
  dynamic showonSliders;
  int sliderPosition;
  int bannerOrder;
  dynamic statusId;
  dynamic statusName;
  dynamic createdById;
  dynamic modifiedById;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String s1080JobId;
  String s1080VideoUrl;
  String s720JobId;
  String s720VideoUrl;
  String s480JobId;
  String s480VideoUrl;
  int i1080Completed;
  int i720Completed;
  int i480Completed;
  dynamic sVideoJobId;
  String sShowOnHome;
  String sShowOnMovies;
  String sShowOnSeries;
  String sShowOnKids;
  String s1080TJobId;
  String s1080TrailorUrl;
  String s720TJobId;
  String s720TrailorUrl;
  String s480TJobId;
  String s480TrailorUrl;
  int i1080TCompleted;
  int i720TCompleted;
  int i480TCompleted;
  dynamic sTrailorJobId;
  String sAllowedInPackage;
  String tagPosition;
  String nBigBannerUrl;
  String nSmallBannerUrl;
  dynamic nSubscriptionBannerUrl;
  String tagUrl;
  dynamic subscriptions;
  dynamic movieprices;
  List<Package> packages;
  List<PaymentGateway> paymentGateways;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        videoType: json["VideoType"],
        language: json["Language"],
        category: json["Category"],
        season: json["Season"],
        episode: json["Episode"],
        name: json["Name"],
        time: json["Time"],
        year: json["Year"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        geographicalArea:
            List<String>.from(json["geographical_area"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        starCast: List<String>.from(json["star_cast"].map((x) => x)),
        sDirector: json["sDirector"],
        synopsis: json["Synopsis"],
        bigBannerUrl: json["BigBannerUrl"],
        smallBannerUrl: json["SmallBannerUrl"],
        infoBannerUrl: json["InfoBannerUrl"],
        trailerUrl: json["TrailerUrl"],
        videoUrl: json["VideoUrl"],
        comingSoon: json["ComingSoon"],
        isFree: json["IsFree"],
        videoStatus: json["VideoStatus"],
        showonSliders: json["ShowonSliders"],
        sliderPosition: json["SliderPosition"],
        bannerOrder: json["banner_order"],
        statusId: json["StatusId"],
        statusName: json["StatusName"],
        createdById: json["CreatedById"],
        modifiedById: json["ModifiedById"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        s1080JobId: json["s1080JobId"],
        s1080VideoUrl: json["s1080VideoUrl"],
        s720JobId: json["s720JobId"],
        s720VideoUrl: json["s720VideoUrl"],
        s480JobId: json["s480JobId"],
        s480VideoUrl: json["s480VideoUrl"],
        i1080Completed: json["i1080Completed"],
        i720Completed: json["i720Completed"],
        i480Completed: json["i480Completed"],
        sVideoJobId: json["sVideoJobId"],
        sShowOnHome: json["sShowOnHome"],
        sShowOnMovies: json["sShowOnMovies"],
        sShowOnSeries: json["sShowOnSeries"],
        sShowOnKids: json["sShowOnKids"],
        s1080TJobId: json["s1080TJobId"],
        s1080TrailorUrl: json["s1080TrailorUrl"],
        s720TJobId: json["s720TJobId"],
        s720TrailorUrl: json["s720TrailorUrl"],
        s480TJobId: json["s480TJobId"],
        s480TrailorUrl: json["s480TrailorUrl"],
        i1080TCompleted: json["i1080TCompleted"],
        i720TCompleted: json["i720TCompleted"],
        i480TCompleted: json["i480TCompleted"],
        sTrailorJobId: json["sTrailorJobId"],
        sAllowedInPackage: json["sAllowedInPackage"],
        tagPosition: json["tagPosition"],
        nBigBannerUrl: json["nBigBannerUrl"],
        nSmallBannerUrl: json["nSmallBannerUrl"],
        nSubscriptionBannerUrl: json["nSubscriptionBannerUrl"],
        tagUrl: json["tagUrl"],
        subscriptions: json["subscriptions"],
        movieprices: json["movieprices"],
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        paymentGateways: List<PaymentGateway>.from(
            json["payment_gateways"].map((x) => PaymentGateway.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "VideoType": videoType,
        "Language": language,
        "Category": category,
        "Season": season,
        "Episode": episode,
        "Name": name,
        "Time": time,
        "Year": year,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "geographical_area": List<dynamic>.from(geographicalArea.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "star_cast": List<dynamic>.from(starCast.map((x) => x)),
        "sDirector": sDirector,
        "Synopsis": synopsis,
        "BigBannerUrl": bigBannerUrl,
        "SmallBannerUrl": smallBannerUrl,
        "InfoBannerUrl": infoBannerUrl,
        "TrailerUrl": trailerUrl,
        "VideoUrl": videoUrl,
        "ComingSoon": comingSoon,
        "IsFree": isFree,
        "VideoStatus": videoStatus,
        "ShowonSliders": showonSliders,
        "SliderPosition": sliderPosition,
        "banner_order": bannerOrder,
        "StatusId": statusId,
        "StatusName": statusName,
        "CreatedById": createdById,
        "ModifiedById": modifiedById,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "deleted_at": deletedAt,
        "s1080JobId": s1080JobId,
        "s1080VideoUrl": s1080VideoUrl,
        "s720JobId": s720JobId,
        "s720VideoUrl": s720VideoUrl,
        "s480JobId": s480JobId,
        "s480VideoUrl": s480VideoUrl,
        "i1080Completed": i1080Completed,
        "i720Completed": i720Completed,
        "i480Completed": i480Completed,
        "sVideoJobId": sVideoJobId,
        "sShowOnHome": sShowOnHome,
        "sShowOnMovies": sShowOnMovies,
        "sShowOnSeries": sShowOnSeries,
        "sShowOnKids": sShowOnKids,
        "s1080TJobId": s1080TJobId,
        "s1080TrailorUrl": s1080TrailorUrl,
        "s720TJobId": s720TJobId,
        "s720TrailorUrl": s720TrailorUrl,
        "s480TJobId": s480TJobId,
        "s480TrailorUrl": s480TrailorUrl,
        "i1080TCompleted": i1080TCompleted,
        "i720TCompleted": i720TCompleted,
        "i480TCompleted": i480TCompleted,
        "sTrailorJobId": sTrailorJobId,
        "sAllowedInPackage": sAllowedInPackage,
        "tagPosition": tagPosition,
        "nBigBannerUrl": nBigBannerUrl,
        "nSmallBannerUrl": nSmallBannerUrl,
        "nSubscriptionBannerUrl": nSubscriptionBannerUrl,
        "tagUrl": tagUrl,
        "subscriptions": subscriptions,
        "movieprices": movieprices,
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
        "payment_gateways":
            List<dynamic>.from(paymentGateways.map((x) => x.toJson())),
      };
}

class Package {
  Package({
    required this.id,
    required this.package,
    required this.description,
    required this.price,
    required this.sCode,
    required this.validityInDays,
    required this.videoType,
    required this.isPackage,
    required this.isActive,
    this.hindiPackage,
    this.hindiPackageDescription,
    this.marathiPackage,
    this.marathiPackageDescription,
    this.tamilPackage,
    this.tamilPackageDescription,
    this.telguPackage,
    this.telguPackageDescription,
    this.kannadaPackage,
    this.kannadaPackageDescription,
    this.punjabiPackage,
    this.punjabiPackageDescription,
    this.gujaratiPackage,
    this.gujaratiPackageDescription,
    this.bengaliPackage,
    this.bengaliPackageDescription,
    this.urduPackage,
    this.urduPackageDescription,
    this.statusId,
    this.statusName,
    this.createdById,
    this.modifiedById,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String package;
  String description;
  String price;
  String sCode;
  int validityInDays;
  String videoType;
  String isPackage;
  String isActive;
  dynamic hindiPackage;
  dynamic hindiPackageDescription;
  dynamic marathiPackage;
  dynamic marathiPackageDescription;
  dynamic tamilPackage;
  dynamic tamilPackageDescription;
  dynamic telguPackage;
  dynamic telguPackageDescription;
  dynamic kannadaPackage;
  dynamic kannadaPackageDescription;
  dynamic punjabiPackage;
  dynamic punjabiPackageDescription;
  dynamic gujaratiPackage;
  dynamic gujaratiPackageDescription;
  dynamic bengaliPackage;
  dynamic bengaliPackageDescription;
  dynamic urduPackage;
  dynamic urduPackageDescription;
  dynamic statusId;
  dynamic statusName;
  dynamic createdById;
  dynamic modifiedById;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        package: json["Package"],
        description: json["Description"],
        price: json["Price"],
        sCode: json["sCode"],
        validityInDays: json["validityInDays"],
        videoType: json["VideoType"],
        isPackage: json["isPackage"],
        isActive: json["isActive"],
        hindiPackage: json["hindiPackage"],
        hindiPackageDescription: json["hindiPackageDescription"],
        marathiPackage: json["marathiPackage"],
        marathiPackageDescription: json["marathiPackageDescription"],
        tamilPackage: json["tamilPackage"],
        tamilPackageDescription: json["tamilPackageDescription"],
        telguPackage: json["telguPackage"],
        telguPackageDescription: json["telguPackageDescription"],
        kannadaPackage: json["kannadaPackage"],
        kannadaPackageDescription: json["kannadaPackageDescription"],
        punjabiPackage: json["punjabiPackage"],
        punjabiPackageDescription: json["punjabiPackageDescription"],
        gujaratiPackage: json["gujaratiPackage"],
        gujaratiPackageDescription: json["gujaratiPackageDescription"],
        bengaliPackage: json["bengaliPackage"],
        bengaliPackageDescription: json["bengaliPackageDescription"],
        urduPackage: json["urduPackage"],
        urduPackageDescription: json["urduPackageDescription"],
        statusId: json["StatusId"],
        statusName: json["StatusName"],
        createdById: json["CreatedById"],
        modifiedById: json["ModifiedById"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Package": package,
        "Description": description,
        "Price": price,
        "sCode": sCode,
        "validityInDays": validityInDays,
        "VideoType": videoType,
        "isPackage": isPackage,
        "isActive": isActive,
        "hindiPackage": hindiPackage,
        "hindiPackageDescription": hindiPackageDescription,
        "marathiPackage": marathiPackage,
        "marathiPackageDescription": marathiPackageDescription,
        "tamilPackage": tamilPackage,
        "tamilPackageDescription": tamilPackageDescription,
        "telguPackage": telguPackage,
        "telguPackageDescription": telguPackageDescription,
        "kannadaPackage": kannadaPackage,
        "kannadaPackageDescription": kannadaPackageDescription,
        "punjabiPackage": punjabiPackage,
        "punjabiPackageDescription": punjabiPackageDescription,
        "gujaratiPackage": gujaratiPackage,
        "gujaratiPackageDescription": gujaratiPackageDescription,
        "bengaliPackage": bengaliPackage,
        "bengaliPackageDescription": bengaliPackageDescription,
        "urduPackage": urduPackage,
        "urduPackageDescription": urduPackageDescription,
        "StatusId": statusId,
        "StatusName": statusName,
        "CreatedById": createdById,
        "ModifiedById": modifiedById,
        "created_at": createdAt == null ? null : createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "deleted_at": deletedAt,
      };
}

class PaymentGateway {
  PaymentGateway({
    required this.id,
    required this.pgName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String pgName;
  int isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        id: json["id"],
        pgName: json["PgName"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "PgName": pgName,
        "isActive": isActive,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
      };
}
