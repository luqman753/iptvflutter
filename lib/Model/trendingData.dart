// To parse this JSON data, do
//
//     final trendingData = trendingDataFromJson(jsonString);

import 'dart:convert';

TrendingData trendingDataFromJson(String str) =>
    TrendingData.fromJson(json.decode(str));

String trendingDataToJson(TrendingData data) => json.encode(data.toJson());

class TrendingData {
  TrendingData({
    this.genreFiler,
    this.moviesFilter,
    this.seriesFilter,
  });

  List<GenreFiler>? genreFiler;
  List<MoviesFilter>? moviesFilter;
  List<SeriesFilter>? seriesFilter;

  factory TrendingData.fromJson(Map<String, dynamic> json) => TrendingData(
        genreFiler: List<GenreFiler>.from(
            json["genreFiler"].map((x) => GenreFiler.fromJson(x))),
        moviesFilter: List<MoviesFilter>.from(
            json["moviesFilter"].map((x) => MoviesFilter.fromJson(x))),
        seriesFilter: List<SeriesFilter>.from(
            json["seriesFilter"].map((x) => SeriesFilter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genreFiler": List<dynamic>.from(genreFiler!.map((x) => x.toJson())),
        "moviesFilter":
            List<dynamic>.from(moviesFilter!.map((x) => x.toJson())),
        "seriesFilter":
            List<dynamic>.from(seriesFilter!.map((x) => x.toJson())),
      };
}

class GenreFiler {
  GenreFiler({
    this.data,
    this.total,
  });

  List<GenresElement>? data;
  int? total;

  factory GenreFiler.fromJson(Map<String, dynamic> json) => GenreFiler(
        data: List<GenresElement>.from(
            json["data"].map((x) => GenresElement.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class GenresElement {
  GenresElement({
    this.id,
    this.name,
    this.isActive,
    this.v,
  });

  String? id;
  String? name;
  bool? isActive;
  int? v;

  factory GenresElement.fromJson(Map<String, dynamic> json) => GenresElement(
        id: json["_id"],
        name: json["name"],
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "isActive": isActive,
        "__v": v,
      };
}

class MoviesFilter {
  MoviesFilter({
    this.data,
    this.total,
  });

  List<MoviesFilterDatum>? data;
  int? total;

  factory MoviesFilter.fromJson(Map<String, dynamic> json) => MoviesFilter(
        data: List<MoviesFilterDatum>.from(
            json["data"].map((x) => MoviesFilterDatum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class MoviesFilterDatum {
  MoviesFilterDatum({
    this.id,
    this.title,
    this.genreId,
    this.description,
    this.rating,
    this.trailer,
    this.year,
    this.url,
    this.duration,
    this.image,
    this.v,
    this.genre,
    this.casts,
  });

  String? id;
  String? title;
  String? genreId;
  String? description;
  String? rating;
  String? trailer;
  String? year;
  String? url;
  String? duration;
  String? image;
  int? v;
  List<GenresElement>? genre;
  List<Cast>? casts;

  factory MoviesFilterDatum.fromJson(Map<String, dynamic> json) =>
      MoviesFilterDatum(
        id: json["_id"],
        title: json["title"],
        genreId: json["genreId"],
        description: json["description"],
        rating: json["rating"],
        trailer: json["trailer"],
        year: json["year"],
        url: json["url"],
        duration: json["duration"],
        image: json["image"],
        v: json["__v"],
        genre: List<GenresElement>.from(
            json["genre"].map((x) => GenresElement.fromJson(x))),
        casts: List<Cast>.from(json["casts"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "genreId": genreId,
        "description": description,
        "rating": rating,
        "trailer": trailer,
        "year": year,
        "url": url,
        "duration": duration,
        "image": image,
        "__v": v,
        "genre": List<dynamic>.from(genre!.map((x) => x.toJson())),
        "casts": List<dynamic>.from(casts!.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    this.id,
    this.streamId,
    this.name,
    this.role,
    this.episodes,
    this.year,
    this.detail,
    this.v,
  });

  String? id;
  Id? streamId;
  String? name;
  String? role;
  String? episodes;
  String? year;
  String? detail;
  int? v;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["_id"],
        streamId: idValues.map![json["streamId"]],
        name: json["name"],
        role: json["role"],
        episodes: json["episodes"],
        year: json["year"],
        detail: json["detail"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "streamId": idValues.reverse[streamId],
        "name": name,
        "role": role,
        "episodes": episodes,
        "year": year,
        "detail": detail,
        "__v": v,
      };
}

enum Id {
  THE_62_FF3840673_AD05_A93_EA094_E,
  THE_62_FF3_F77673_AD05_A93_EA0993,
  THE_62_FF3_FD6673_AD05_A93_EA09_C0,
  THE_62_FF407_C673_AD05_A93_EA09_EB,
  THE_62_F35_F05_BA5045_ECC4_AB703_D,
  THE_62_F389_A07_CA5787_D3_B9_BCEB6,
  THE_62_F38_A587_CA5787_D3_B9_BCEED,
  THE_62_F38_ADE7_CA5787_D3_B9_BCF3_A,
  THE_62_F38_B357_CA5787_D3_B9_BCF55,
  THE_62_F38_C0_F7_CA5787_D3_B9_BCF66,
  THE_62_F38_E237_CA5787_D3_B9_BCF7_F,
  THE_62_FF34_D8673_AD05_A93_EA08_B5,
  THE_62_FF40_DF673_AD05_A93_EA0_A1_A
}

final idValues = EnumValues({
  "62f35f05ba5045ecc4ab703d": Id.THE_62_F35_F05_BA5045_ECC4_AB703_D,
  "62f389a07ca5787d3b9bceb6": Id.THE_62_F389_A07_CA5787_D3_B9_BCEB6,
  "62f38a587ca5787d3b9bceed": Id.THE_62_F38_A587_CA5787_D3_B9_BCEED,
  "62f38ade7ca5787d3b9bcf3a": Id.THE_62_F38_ADE7_CA5787_D3_B9_BCF3_A,
  "62f38b357ca5787d3b9bcf55": Id.THE_62_F38_B357_CA5787_D3_B9_BCF55,
  "62f38c0f7ca5787d3b9bcf66": Id.THE_62_F38_C0_F7_CA5787_D3_B9_BCF66,
  "62f38e237ca5787d3b9bcf7f": Id.THE_62_F38_E237_CA5787_D3_B9_BCF7_F,
  "62ff34d8673ad05a93ea08b5": Id.THE_62_FF34_D8673_AD05_A93_EA08_B5,
  "62ff3840673ad05a93ea094e": Id.THE_62_FF3840673_AD05_A93_EA094_E,
  "62ff3f77673ad05a93ea0993": Id.THE_62_FF3_F77673_AD05_A93_EA0993,
  "62ff3fd6673ad05a93ea09c0": Id.THE_62_FF3_FD6673_AD05_A93_EA09_C0,
  "62ff407c673ad05a93ea09eb": Id.THE_62_FF407_C673_AD05_A93_EA09_EB,
  "62ff40df673ad05a93ea0a1a": Id.THE_62_FF40_DF673_AD05_A93_EA0_A1_A
});

class SeriesFilter {
  SeriesFilter({
    this.data,
    this.total,
  });

  List<SeriesFilterDatum>? data;
  int? total;

  factory SeriesFilter.fromJson(Map<String, dynamic> json) => SeriesFilter(
        data: List<SeriesFilterDatum>.from(
            json["data"].map((x) => SeriesFilterDatum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class SeriesFilterDatum {
  SeriesFilterDatum({
    this.id,
    this.title,
    this.storyline,
    this.genreId,
    this.rating,
    this.episodes,
    this.trailer,
    this.image,
    this.v,
    this.genres,
    this.casts,
    this.seasons,
  });

  Id? id;
  String? title;
  String? storyline;
  String? genreId;
  String? rating;
  String? episodes;
  String? trailer;
  String? image;
  int? v;
  GenresElement? genres;
  List<Cast>? casts;
  List<Season>? seasons;

  factory SeriesFilterDatum.fromJson(Map<String, dynamic> json) =>
      SeriesFilterDatum(
        id: idValues.map![json["_id"]],
        title: json["title"],
        storyline: json["storyline"],
        genreId: json["genreId"],
        rating: json["rating"],
        episodes: json["episodes"],
        trailer: json["trailer"],
        image: json["image"],
        v: json["__v"],
        genres: GenresElement.fromJson(json["genres"]),
        casts: List<Cast>.from(json["casts"].map((x) => Cast.fromJson(x))),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "title": title,
        "storyline": storyline,
        "genreId": genreId,
        "rating": rating,
        "episodes": episodes,
        "trailer": trailer,
        "image": image,
        "__v": v,
        "genres": genres!.toJson(),
        "casts": List<dynamic>.from(casts!.map((x) => x.toJson())),
        "seasons": List<dynamic>.from(seasons!.map((x) => x.toJson())),
      };
}

class Season {
  Season({
    this.id,
    this.seriesId,
    this.season,
    this.name,
    this.image,
    this.v,
    this.epsiodes,
  });

  String? id;
  Id? seriesId;
  String? season;
  String? name;
  String? image;
  int? v;
  List<Epsiode>? epsiodes;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["_id"],
        seriesId: idValues.map![json["seriesId"]],
        season: json["season"],
        name: json["name"],
        image: json["image"],
        v: json["__v"],
        epsiodes: List<Epsiode>.from(
            json["epsiodes"].map((x) => Epsiode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seriesId": idValues.reverse[seriesId],
        "season": season,
        "name": name,
        "image": image,
        "__v": v,
        "epsiodes": List<dynamic>.from(epsiodes!.map((x) => x.toJson())),
      };
}

class Epsiode {
  Epsiode({
    this.id,
    this.seasonId,
    this.episode,
    this.title,
    this.description,
    this.url,
    this.v,
  });

  String? id;
  String? seasonId;
  String? episode;
  String? title;
  String? description;
  String? url;
  int? v;

  factory Epsiode.fromJson(Map<String, dynamic> json) => Epsiode(
        id: json["_id"],
        seasonId: json["seasonId"],
        episode: json["episode"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seasonId": seasonId,
        "episode": episode,
        "title": title,
        "description": description,
        "url": url,
        "__v": v,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
