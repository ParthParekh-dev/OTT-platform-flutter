import 'dart:convert';

HomePageResponse homePageResponseFromJson(String str) =>
    HomePageResponse.fromJson(json.decode(str));

String homePageResponseToJson(HomePageResponse data) =>
    json.encode(data.toJson());

class HomePageResponse {
  HomePageResponse({
    required this.banners,
    required this.categories,
  });

  List<HomePageResponseBanner> banners;
  List<Category> categories;

  factory HomePageResponse.fromJson(Map<String, dynamic> json) =>
      HomePageResponse(
        banners: List<HomePageResponseBanner>.from(
            json["banners"].map((x) => HomePageResponseBanner.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class HomePageResponseBanner {
  HomePageResponseBanner({
    required this.id,
    required this.iVideoId,
    required this.bannerUrl,
    required this.bannerOrder,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.videodetails,
  });

  int id;
  int iVideoId;
  String bannerUrl;
  int bannerOrder;
  int isActive;
  DateTime createdAt;
  DateTime? updatedAt;
  Videodetails videodetails;

  factory HomePageResponseBanner.fromJson(Map<String, dynamic> json) =>
      HomePageResponseBanner(
        id: json["id"],
        iVideoId: json["iVideoId"],
        bannerUrl: json["bannerUrl"],
        bannerOrder: json["bannerOrder"],
        isActive: json["isActive"],
        createdAt: DateTime?.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        videodetails: Videodetails.fromJson(json["videodetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iVideoId": iVideoId,
        "bannerUrl": bannerUrl,
        "bannerOrder": bannerOrder,
        "isActive": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
        "videodetails": videodetails.toJson(),
      };
}

class Videodetails {
  Videodetails({
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
    required this.infoBannerUrl,
    required this.trailerUrl,
    required this.videoUrl,
    required this.comingSoon,
    required this.isFree,
    required this.videoStatus,
    required this.showonSliders,
    required this.sliderPosition,
    required this.bannerOrder,
    required this.statusId,
    required this.statusName,
    required this.createdById,
    required this.modifiedById,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.s1080JobId,
    required this.s1080VideoUrl,
    required this.s720JobId,
    required this.s720VideoUrl,
    required this.s480JobId,
    required this.s480VideoUrl,
    required this.i1080Completed,
    required this.i720Completed,
    required this.i480Completed,
    required this.sVideoJobId,
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
    required this.sTrailorJobId,
    required this.sAllowedInPackage,
    required this.tagPosition,
    required this.nBigBannerUrl,
    required this.nSmallBannerUrl,
    required this.nSubscriptionBannerUrl,
    required this.tagUrl,
  });

  int id;
  String videoType;
  String language;
  CategoryEnum? category;
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
  String infoBannerUrl;
  String trailerUrl;
  String videoUrl;
  ComingSoon? comingSoon;
  ComingSoon? isFree;
  VideoStatus? videoStatus;
  dynamic showonSliders;
  int sliderPosition;
  int bannerOrder;
  int statusId;
  StatusName? statusName;
  dynamic createdById;
  dynamic modifiedById;
  DateTime? createdAt;
  DateTime? updatedAt;
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
  SShowOn? sShowOnHome;
  SShowOn? sShowOnMovies;
  SShowOn? sShowOnSeries;
  SShowOn? sShowOnKids;
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
  TagPosition? tagPosition;
  String nBigBannerUrl;
  String nSmallBannerUrl;
  String nSubscriptionBannerUrl;
  String tagUrl;

  factory Videodetails.fromJson(Map<String, dynamic> json) => Videodetails(
        id: json["id"],
        videoType: json["VideoType"],
        language: json["Language"],
        category: categoryEnumValues.map[json["Category"]],
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
        bigBannerUrl:
            json["BigBannerUrl"] == null ? null : json["BigBannerUrl"],
        smallBannerUrl:
            json["SmallBannerUrl"] == null ? null : json["SmallBannerUrl"],
        infoBannerUrl:
            json["InfoBannerUrl"] == null ? null : json["InfoBannerUrl"],
        trailerUrl: json["TrailerUrl"] == null ? null : json["TrailerUrl"],
        videoUrl: json["VideoUrl"] == null ? null : json["VideoUrl"],
        comingSoon: comingSoonValues.map[json["ComingSoon"]],
        isFree: comingSoonValues.map[json["IsFree"]],
        videoStatus: videoStatusValues.map[json["VideoStatus"]],
        showonSliders: json["ShowonSliders"],
        sliderPosition:
            json["SliderPosition"] == null ? null : json["SliderPosition"],
        bannerOrder: json["banner_order"] == null ? null : json["banner_order"],
        statusId: json["StatusId"] == null ? null : json["StatusId"],
        statusName: json["StatusName"] == null
            ? null
            : statusNameValues.map[json["StatusName"]],
        createdById: json["CreatedById"],
        modifiedById: json["ModifiedById"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        sShowOnHome: sShowOnValues.map[json["sShowOnHome"]],
        sShowOnMovies: sShowOnValues.map[json["sShowOnMovies"]],
        sShowOnSeries: sShowOnValues.map[json["sShowOnSeries"]],
        sShowOnKids: sShowOnValues.map[json["sShowOnKids"]],
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
        tagPosition: json["tagPosition"] == null
            ? null
            : tagPositionValues.map[json["tagPosition"]],
        nBigBannerUrl: json["nBigBannerUrl"],
        nSmallBannerUrl: json["nSmallBannerUrl"],
        nSubscriptionBannerUrl: json["nSubscriptionBannerUrl"] == null
            ? null
            : json["nSubscriptionBannerUrl"],
        tagUrl: json["tagUrl"] == null ? null : json["tagUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "VideoType": videoType,
        "Language": language,
        "Category": categoryEnumValues.reverse[category],
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
        "ComingSoon": comingSoonValues.reverse[comingSoon],
        "IsFree": comingSoonValues.reverse[isFree],
        "VideoStatus": videoStatusValues.reverse[videoStatus],
        "ShowonSliders": showonSliders,
        "SliderPosition": sliderPosition,
        "banner_order": bannerOrder,
        "StatusId": statusId,
        "StatusName":
            statusName == null ? null : statusNameValues.reverse[statusName],
        "CreatedById": createdById,
        "ModifiedById": modifiedById,
        "created_at": createdAt == null ? null : createdAt.toString(),
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
        "sShowOnHome": sShowOnValues.reverse[sShowOnHome],
        "sShowOnMovies": sShowOnValues.reverse[sShowOnMovies],
        "sShowOnSeries": sShowOnValues.reverse[sShowOnSeries],
        "sShowOnKids": sShowOnValues.reverse[sShowOnKids],
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
        "tagPosition":
            tagPosition == null ? null : tagPositionValues.reverse[tagPosition],
        "nBigBannerUrl": nBigBannerUrl,
        "nSmallBannerUrl": nSmallBannerUrl,
        "nSubscriptionBannerUrl": nSubscriptionBannerUrl,
        "tagUrl": tagUrl,
      };
}

enum CategoryEnum {
  HINDI,
  HINDI_SUB,
  BHOJPURI,
  ENGLISH,
  TAMIL,
  TELUGU,
  KANNADA,
  PANJABI,
  GUJRATI,
  ENGLISH_SUB,
  CATEGORY_HINDI_SUB,
  TAMIL_SUB,
  TELUGU_SUB,
  KANNADA_SUB,
  MARATHI
}

final categoryEnumValues = EnumValues({
  "Bhojpuri": CategoryEnum.BHOJPURI,
  "Hindi Sub": CategoryEnum.CATEGORY_HINDI_SUB,
  "English": CategoryEnum.ENGLISH,
  "English Sub": CategoryEnum.ENGLISH_SUB,
  "Gujrati": CategoryEnum.GUJRATI,
  "Hindi": CategoryEnum.HINDI,
  "Hindi sub": CategoryEnum.HINDI_SUB,
  "Kannada": CategoryEnum.KANNADA,
  "Kannada Sub": CategoryEnum.KANNADA_SUB,
  "Marathi": CategoryEnum.MARATHI,
  "Panjabi": CategoryEnum.PANJABI,
  "Tamil": CategoryEnum.TAMIL,
  "Tamil Sub": CategoryEnum.TAMIL_SUB,
  "Telugu": CategoryEnum.TELUGU,
  "Telugu Sub": CategoryEnum.TELUGU_SUB
});

enum ComingSoon { NO, YES }

final comingSoonValues =
    EnumValues({"No": ComingSoon.NO, "Yes": ComingSoon.YES});

enum SShowOn { Y, N }

final sShowOnValues = EnumValues({"N": SShowOn.N, "Y": SShowOn.Y});

enum StatusName { ACTIVE }

final statusNameValues = EnumValues({"Active": StatusName.ACTIVE});

enum TagPosition { TOP_RIGHT, TOP_LEFT }

final tagPositionValues = EnumValues(
    {"Top Left": TagPosition.TOP_LEFT, "Top Right": TagPosition.TOP_RIGHT});

enum VideoStatus { PUBLISHED }

final videoStatusValues = EnumValues({"Published": VideoStatus.PUBLISHED});

class Category {
  Category({
    required this.id,
    required this.iCategoryId,
    required this.iCategoryOrder,
    required this.iType,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.banners,
  });

  int id;
  int iCategoryId;
  int iCategoryOrder;
  IType? iType;
  int isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String category;
  List<CategoryBanner>? banners;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        iCategoryId: json["iCategoryId"],
        iCategoryOrder: json["iCategoryOrder"],
        iType: iTypeValues.map[json["iType"]],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        category: json["category"],
        banners: json["banners"] == null
            ? null
            : List<CategoryBanner>.from(
                json["banners"].map((x) => CategoryBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iCategoryId": iCategoryId,
        "iCategoryOrder": iCategoryOrder,
        "iType": iTypeValues.reverse[iType],
        "isActive": isActive,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
        "category": category,
        "banners": banners == null
            ? null
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
      };
}

class CategoryBanner {
  CategoryBanner({
    required this.id,
    required this.iCategoryId,
    required this.iVideoId,
    required this.iBannerUrl,
    required this.iBannerOrder,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.videodetails,
  });

  int id;
  int iCategoryId;
  int iVideoId;
  String iBannerUrl;
  int iBannerOrder;
  int isActive;
  DateTime createdAt;
  DateTime? updatedAt;
  Videodetails videodetails;

  factory CategoryBanner.fromJson(Map<String, dynamic> json) => CategoryBanner(
        id: json["id"],
        iCategoryId: json["iCategoryId"],
        iVideoId: json["iVideoId"],
        iBannerUrl: json["iBannerUrl"],
        iBannerOrder: json["iBannerOrder"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        videodetails: Videodetails.fromJson(json["videodetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iCategoryId": iCategoryId,
        "iVideoId": iVideoId,
        "iBannerUrl": iBannerUrl,
        "iBannerOrder": iBannerOrder,
        "isActive": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
        "videodetails": videodetails.toJson(),
      };
}

enum IType { HORIZONTAL, VERTICAL, COMMING_SOON }

final iTypeValues = EnumValues({
  "Comming Soon": IType.COMMING_SOON,
  "Horizontal": IType.HORIZONTAL,
  "Vertical": IType.VERTICAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
