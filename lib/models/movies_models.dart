import 'dart:convert';

Hoblist hoblistFromJson(String str) => Hoblist.fromJson(json.decode(str));

String hoblistToJson(Hoblist data) => json.encode(data.toJson());

class Hoblist {
  Hoblist({
    required this.result,
    required this.queryParam,
    required this.code,
    required this.message,
  });

  List<Result> result;
  QueryParam queryParam;
  int code;
  String message;

  factory Hoblist.fromJson(Map<String, dynamic> json) => Hoblist(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        queryParam: QueryParam.fromJson(json["queryParam"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "queryParam": queryParam.toJson(),
        "code": code,
        "message": message,
      };
}

class QueryParam {
  QueryParam({
    required this.category,
    required this.language,
    required this.genre,
    required this.sort,
  });

  String category;
  String language;
  String genre;
  String sort;

  factory QueryParam.fromJson(Map<String, dynamic> json) => QueryParam(
        category: json["category"],
        language: json["language"],
        genre: json["genre"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort,
      };
}

class Result {
  Result({
    required this.id,
    required this.director,
    required this.writers,
    required this.stars,
    required this.releasedDate,
    required this.productionCompany,
    required this.title,
    required this.language,
    required this.runTime,
    required this.genre,
    required this.voted,
    required this.poster,
    required this.pageViews,
    required this.description,
    required this.upVoted,
    required this.downVoted,
    required this.totalVoted,
    required this.voting,
  });

  String id;
  List<String> director;
  List<String> writers;
  List<String> stars;
  int releasedDate;
  List<String> productionCompany;
  String title;
  String language;
  int runTime;
  String genre;
  List<Voted> voted;
  String poster;
  int pageViews;
  String description;
  List<String> upVoted;
  List<String> downVoted;
  int totalVoted;
  int voting;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        director: List<String>.from(json["director"].map((x) => x)),
        writers: List<String>.from(json["writers"].map((x) => x)),
        stars: List<String>.from(json["stars"].map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany:
            List<String>.from(json["productionCompany"].map((x) => x)),
        title: json["title"],
        language: json["language"],
        runTime: json["runTime"] == null ? 0 : json["runTime"],
        genre: json["genre"],
        voted: List<Voted>.from(json["voted"].map((x) => Voted.fromJson(x))),
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        upVoted: json["upVoted"] == null
            ? ['']
            : List<String>.from(json["upVoted"].map((x) => x)),
        downVoted: json["downVoted"] == null
            ? ['']
            : List<String>.from(json["downVoted"].map((x) => x)),
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "director": List<dynamic>.from(director.map((x) => x)),
        "writers": List<dynamic>.from(writers.map((x) => x)),
        "stars": List<dynamic>.from(stars.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany":
            List<dynamic>.from(productionCompany.map((x) => x)),
        "title": title,
        "language": language,
        // ignore: unnecessary_null_comparison
        "runTime": runTime == null ? null : runTime,
        "genre": genre,
        "voted": List<dynamic>.from(voted.map((x) => x.toJson())),
        "poster": poster,
        "pageViews": pageViews,
        "description": description,
        // ignore: unnecessary_null_comparison
        "upVoted":
            upVoted == null ? null : List<dynamic>.from(upVoted.map((x) => x)),
        // ignore: unnecessary_null_comparison
        "downVoted": downVoted == null
            ? null
            : List<dynamic>.from(downVoted.map((x) => x)),
        "totalVoted": totalVoted,
        "voting": voting,
      };
}

// enum Language { KANNADA }

// final languageValues = EnumValues({
//     "Kannada": Language.KANNADA
// });

class Voted {
  Voted({
    required this.upVoted,
    required this.downVoted,
    required this.id,
    required this.updatedAt,
    required this.genre,
  });

  List<String> upVoted;
  List<dynamic> downVoted;
  String id;
  int updatedAt;
  String genre;

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        upVoted: List<String>.from(json["upVoted"].map((x) => x)),
        downVoted: List<dynamic>.from(json["downVoted"].map((x) => x)),
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "upVoted": List<dynamic>.from(upVoted.map((x) => x)),
        "downVoted": List<dynamic>.from(downVoted.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
      };
}

// class EnumValues<T> {
//    Map<String, T> map;
//    late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         // ignore: unnecessary_null_comparison
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
