// ignore_for_file: file_names

/*
 * room_movie
 *     tv_result.dart
 *     Created by Fajar Adi Prasetyo on 31/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:room_movie/models/movie/detail/credits.dart';
import 'package:room_movie/models/movie/detail/external_ids.dart';

import 'detail/genres.dart';
import 'detail/images.dart';
import 'detail/keywords.dart';
import 'detail/recommendations.dart';
import 'detail/spoken_languages.dart';
import 'detail/videos.dart';

class Results {
  Results(
      {this.adult,
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
      this.budget,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.keywords,
      this.videos,
      this.genres,
      this.credits,
      this.images,
      this.recommendations,
      this.homepage,
      this.imdbId,
      this.externalIds});

  Results.fromJson(dynamic json) {
    adult = json['adult'] ?? false;
    backdropPath = json['backdrop_path'] ?? "";
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'] ?? 0;
    originalLanguage = json['original_language'] ?? "";
    originalTitle = json['original_title'] ?? "";
    overview = json['overview'] ?? "";
    popularity = json['popularity'] != null
        ? double.parse(json["popularity"].toString())
        : 0.0;
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
    adult = json['adult'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    imdbId = json['imdb_id'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    keywords =
        json['keywords'] != null ? Keywords.fromJson(json['keywords']) : null;
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
    credits =
        json['credits'] != null ? Credits.fromJson(json['credits']) : null;
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
    externalIds = json['external_ids'] != null
        ? ExternalIds.fromJson(json['external_ids'])
        : null;
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

  int? budget;
  List<Genres>? genres;
  String? homepage;
  String? imdbId;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  Keywords? keywords;
  Videos? videos;
  Credits? credits;
  Images? images;
  Recommendations? recommendations;
  ExternalIds? externalIds;

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
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['imdb_id'] = imdbId;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    if (keywords != null) {
      map['keywords'] = keywords?.toJson();
    }
    if (videos != null) {
      map['videos'] = videos?.toJson();
    }
    if (credits != null) {
      map['credits'] = credits?.toJson();
    }
    if (images != null) {
      map['images'] = images?.toJson();
    }
    if (recommendations != null) {
      map['recommendations'] = recommendations?.toJson();
    }
    if (externalIds != null) {
      map['external_ids'] = externalIds?.toJson();
    }
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
    return [Results(), Results(), Results(), Results(), Results()];
  }

  static List<Results> get newData {
    return [];
  }
}
