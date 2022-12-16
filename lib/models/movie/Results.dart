/*
 * room_movie
 *     tv_result.dart
 *     Created by Fajar Adi Prasetyo on 31/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

class Results {
  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.firstAirDate,
    this.name,
    this.originCountry,
    this.originalName,
  });

  Results.fromJson(dynamic json) {
    adult = json['adult'] ?? false;
    backdropPath = json['backdrop_path'] ?? "";
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'] ?? 0;
    originalLanguage = json['original_language'] ?? "";
    originalTitle = json['original_title'] ?? "";
    overview = json['overview'] ?? "";
    popularity = json['popularity'] ?? 0.0;
    posterPath = json['poster_path'] ?? "";
    releaseDate = json['release_date'] ?? "";
    title = json['title'];
    video = json['video'] ?? false;
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'] ?? 0;
    firstAirDate = json['first_air_date'] ?? "";
    name = json['name'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    originalName = json['original_name'] ?? "";
  }

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  String? voteAverage;
  int? voteCount;
  String? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['first_air_date'] = firstAirDate;
    map['name'] = name;
    map['origin_country'] = originCountry;
    map['original_name'] = originalName;
    return map;
  }
}

class StaticResults {
  static List<Results> jsonList(List<dynamic> mapList) {
    var list = <Results>[];
    for (var e in mapList) {
      list.add(Results.fromJson(e));
    }
    return list;
  }

  static List<Results> get load {
    return [Results()];
  }
}
