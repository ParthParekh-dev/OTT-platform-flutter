// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    required this.search,
    required this.status,
  });

  List<Search> search;
  String status;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        search:
            List<Search>.from(json["search"].map((x) => Search.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "search": List<dynamic>.from(search.map((x) => x.toJson())),
        "status": status,
      };
}

class Search {
  Search({
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
    this.showonSliders,
    required this.sliderPosition,
    required this.bannerOrder,
    required this.statusId,
    required this.statusName,
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
    required this.nSubscriptionBannerUrl,
    required this.tagUrl,
    required this.adsForPaidMovie,
    required this.adsPaidMovieCount,
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
  List<String>? genre;
  List<String> geographicalArea;
  List<String>? tags;
  List<String>? starCast;
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
  SShowOnSeries? sShowOnSeries;
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
  AdsForPaidMovie? adsForPaidMovie;
  String adsPaidMovieCount;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        videoType: json["VideoType"],
        language: json["Language"],
        category: json["Category"],
        season: json["Season"],
        episode: json["Episode"],
        name: json["Name"],
        time: json["Time"],
        year: json["Year"],
        genre: json["genre"] == null
            ? null
            : List<String>.from(json["genre"].map((x) => x)),
        geographicalArea:
            List<String>.from(json["geographical_area"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        starCast: json["star_cast"] == null
            ? null
            : List<String>.from(json["star_cast"].map((x) => x)),
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
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        sShowOnHome: json["sShowOnHome"] == null
            ? null
            : sShowOnValues.map[json["sShowOnHome"]],
        sShowOnMovies: json["sShowOnMovies"] == null
            ? null
            : sShowOnValues.map[json["sShowOnMovies"]],
        sShowOnSeries: json["sShowOnSeries"] == null
            ? null
            : sShowOnSeriesValues.map[json["sShowOnSeries"]],
        sShowOnKids: json["sShowOnKids"] == null
            ? null
            : sShowOnValues.map[json["sShowOnKids"]],
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
        nBigBannerUrl:
            json["nBigBannerUrl"] == null ? null : json["nBigBannerUrl"],
        nSmallBannerUrl:
            json["nSmallBannerUrl"] == null ? null : json["nSmallBannerUrl"],
        nSubscriptionBannerUrl: json["nSubscriptionBannerUrl"] == null
            ? null
            : json["nSubscriptionBannerUrl"],
        tagUrl: json["tagUrl"] == null ? null : json["tagUrl"],
        adsForPaidMovie: adsForPaidMovieValues.map[json["ads_for_paid_movie"]],
        adsPaidMovieCount: json["ads_paid_movie_count"],
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
        "genre":
            genre == null ? null : List<dynamic>.from(genre!.map((x) => x)),
        "geographical_area": List<dynamic>.from(geographicalArea.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "star_cast": starCast == null
            ? null
            : List<dynamic>.from(starCast!.map((x) => x)),
        "sDirector": sDirector,
        "Synopsis": synopsis,
        "BigBannerUrl": bigBannerUrl == null ? null : bigBannerUrl,
        "SmallBannerUrl": smallBannerUrl == null ? null : smallBannerUrl,
        "InfoBannerUrl": infoBannerUrl == null ? null : infoBannerUrl,
        "TrailerUrl": trailerUrl == null ? null : trailerUrl,
        "VideoUrl": videoUrl == null ? null : videoUrl,
        "ComingSoon": comingSoonValues.reverse[comingSoon],
        "IsFree": comingSoonValues.reverse[isFree],
        "VideoStatus": videoStatusValues.reverse[videoStatus],
        "ShowonSliders": showonSliders,
        "SliderPosition": sliderPosition == null ? null : sliderPosition,
        "banner_order": bannerOrder == null ? null : bannerOrder,
        "StatusId": statusId == null ? null : statusId,
        "StatusName":
            statusName == null ? null : statusNameValues.reverse[statusName],
        "CreatedById": createdById,
        "ModifiedById": modifiedById,
        "created_at": createdAt == null ? null : createdAt.toString(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
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
        "sShowOnHome":
            sShowOnHome == null ? null : sShowOnValues.reverse[sShowOnHome],
        "sShowOnMovies":
            sShowOnMovies == null ? null : sShowOnValues.reverse[sShowOnMovies],
        "sShowOnSeries": sShowOnSeries == null
            ? null
            : sShowOnSeriesValues.reverse[sShowOnSeries],
        "sShowOnKids":
            sShowOnKids == null ? null : sShowOnValues.reverse[sShowOnKids],
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
        "nBigBannerUrl": nBigBannerUrl == null ? null : nBigBannerUrl,
        "nSmallBannerUrl": nSmallBannerUrl == null ? null : nSmallBannerUrl,
        "nSubscriptionBannerUrl":
            nSubscriptionBannerUrl == null ? null : nSubscriptionBannerUrl,
        "tagUrl": tagUrl == null ? null : tagUrl,
        "ads_for_paid_movie": adsForPaidMovieValues.reverse[adsForPaidMovie],
        "ads_paid_movie_count": adsPaidMovieCount,
      };
}

enum AdsForPaidMovie { NO, YES }

final adsForPaidMovieValues =
    EnumValues({"no": AdsForPaidMovie.NO, "yes": AdsForPaidMovie.YES});

enum ComingSoon { NO, YES }

final comingSoonValues =
    EnumValues({"No": ComingSoon.NO, "Yes": ComingSoon.YES});

enum SShowOn { Y, N, S_SHOW_ON_N }

final sShowOnValues =
    EnumValues({"N": SShowOn.N, "n": SShowOn.S_SHOW_ON_N, "Y": SShowOn.Y});

enum SShowOnSeries { N, Y, S_SHOW_ON_SERIES_Y }

final sShowOnSeriesValues = EnumValues({
  "N": SShowOnSeries.N,
  "Y": SShowOnSeries.S_SHOW_ON_SERIES_Y,
  "y": SShowOnSeries.Y
});

enum StatusName { ACTIVE }

final statusNameValues = EnumValues({"Active": StatusName.ACTIVE});

enum TagPosition { TOP_RIGHT, TOP_LEFT }

final tagPositionValues = EnumValues(
    {"Top Left": TagPosition.TOP_LEFT, "Top Right": TagPosition.TOP_RIGHT});

enum VideoStatus { PUBLISHED, UNPUBLISHED }

final videoStatusValues = EnumValues({
  "Published": VideoStatus.PUBLISHED,
  "Unpublished": VideoStatus.UNPUBLISHED
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
