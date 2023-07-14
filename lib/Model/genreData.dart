// To parse this JSON data, do
//
//     final genreFIlter = genreFIlterFromJson(jsonString);

import 'dart:convert';

GenreFIlter genreFIlterFromJson(String str) =>
    GenreFIlter.fromJson(json.decode(str));

String genreFIlterToJson(GenreFIlter data) => json.encode(data.toJson());

class GenreFIlter {
  GenreFIlter({
    this.moviesFilter,
    this.seriesFilter,
  });

  List<MoviesFilter>? moviesFilter;
  List<SeriesFilter>? seriesFilter;

  factory GenreFIlter.fromJson(Map<String, dynamic> json) => GenreFIlter(
        moviesFilter: List<MoviesFilter>.from(
            json["moviesFilter"].map((x) => MoviesFilter.fromJson(x))),
        seriesFilter: List<SeriesFilter>.from(
            json["seriesFilter"].map((x) => SeriesFilter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "moviesFilter":
            List<dynamic>.from(moviesFilter!.map((x) => x.toJson())),
        "seriesFilter":
            List<dynamic>.from(seriesFilter!.map((x) => x.toJson())),
      };
}

class MoviesFilter {
  MoviesFilter({
    this.movies,
    this.total,
  });

  List<Movie>? movies;
  int? total;

  factory MoviesFilter.fromJson(Map<String, dynamic> json) => MoviesFilter(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies!.map((x) => x.toJson())),
        "total": total,
      };
}

class Movie {
  Movie({
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
  List<Genre>? genre;
  List<dynamic>? casts;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
        genre: List<Genre>.from(json["genre"].map((x) => Genre.fromJson(x))),
        casts: List<dynamic>.from(json["casts"].map((x) => x)),
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
        "casts": List<dynamic>.from(casts!.map((x) => x)),
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
    this.isActive,
    this.v,
  });

  String? id;
  String? name;
  bool? isActive;
  int? v;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
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

class SeriesFilter {
  SeriesFilter({
    this.series,
    this.total,
  });

  List<Series>? series;
  int? total;

  factory SeriesFilter.fromJson(Map<String, dynamic> json) => SeriesFilter(
        series:
            List<Series>.from(json["series"].map((x) => Series.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "series": List<dynamic>.from(series!.map((x) => x.toJson())),
        "total": total,
      };
}

class Series {
  Series({
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

  String? id;
  String? title;
  String? storyline;
  String? genreId;
  String? rating;
  String? episodes;
  String? trailer;
  String? image;
  int? v;
  Genre? genres;
  List<dynamic>? casts;
  List<Season>? seasons;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["_id"],
        title: json["title"],
        storyline: json["storyline"],
        genreId: json["genreId"],
        rating: json["rating"],
        episodes: json["episodes"],
        trailer: json["trailer"],
        image: json["image"],
        v: json["__v"],
        genres: Genre.fromJson(json["genres"]),
        casts: List<dynamic>.from(json["casts"].map((x) => x)),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "storyline": storyline,
        "genreId": genreId,
        "rating": rating,
        "episodes": episodes,
        "trailer": trailer,
        "image": image,
        "__v": v,
        "genres": genres!.toJson(),
        "casts": List<dynamic>.from(casts!.map((x) => x)),
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

  Id? id;
  String? seriesId;
  String? season;
  String? name;
  String? image;
  int? v;
  List<Epsiode>? epsiodes;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: idValues.map![json["_id"]],
        seriesId: json["seriesId"],
        season: json["season"],
        name: json["name"],
        image: json["image"],
        v: json["__v"],
        epsiodes: List<Epsiode>.from(
            json["epsiodes"].map((x) => Epsiode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "seriesId": seriesId,
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
  Id? seasonId;
  String? episode;
  String? title;
  String? description;
  String? url;
  int? v;

  factory Epsiode.fromJson(Map<String, dynamic> json) => Epsiode(
        id: json["_id"],
        seasonId: idValues.map![json["seasonId"]],
        episode: json["episode"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seasonId": idValues.reverse[seasonId],
        "episode": episode,
        "title": title,
        "description": description,
        "url": url,
        "__v": v,
      };
}

enum Id {
  THE_62_FF3529673_AD05_A93_EA08_DF,
  THE_62_FF353_B673_AD05_A93_EA08_F1,
  THE_62_FF3547673_AD05_A93_EA0903,
  THE_62_FF3556673_AD05_A93_EA0919,
  THE_62_FF441_F673_AD05_A93_EA0_AB5,
  THE_62_FF442_E673_AD05_A93_EA0_AC9,
  THE_62_FF4445673_AD05_A93_EA0_ADB,
  THE_62_FF445_B673_AD05_A93_EA0_AEF,
  THE_62_FF4410673_AD05_A93_EA0_AB3
}

final idValues = EnumValues({
  "62ff3529673ad05a93ea08df": Id.THE_62_FF3529673_AD05_A93_EA08_DF,
  "62ff353b673ad05a93ea08f1": Id.THE_62_FF353_B673_AD05_A93_EA08_F1,
  "62ff3547673ad05a93ea0903": Id.THE_62_FF3547673_AD05_A93_EA0903,
  "62ff3556673ad05a93ea0919": Id.THE_62_FF3556673_AD05_A93_EA0919,
  "62ff4410673ad05a93ea0ab3": Id.THE_62_FF4410673_AD05_A93_EA0_AB3,
  "62ff441f673ad05a93ea0ab5": Id.THE_62_FF441_F673_AD05_A93_EA0_AB5,
  "62ff442e673ad05a93ea0ac9": Id.THE_62_FF442_E673_AD05_A93_EA0_AC9,
  "62ff4445673ad05a93ea0adb": Id.THE_62_FF4445673_AD05_A93_EA0_ADB,
  "62ff445b673ad05a93ea0aef": Id.THE_62_FF445_B673_AD05_A93_EA0_AEF
});

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
