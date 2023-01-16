// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 16/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import '../movie/Results.dart';
import '../movie/detail/credits.dart';
import '../movie/detail/external_ids.dart';
import '../movie/detail/genres.dart';
import '../movie/detail/images.dart';
import '../movie/detail/keywords.dart';
import '../movie/detail/network_item.dart';
import '../movie/detail/recommendations.dart';
import '../movie/detail/season_item.dart';
import '../movie/detail/spoken_languages.dart';
import '../movie/detail/videos.dart';

class SearchItem {
  SearchItem(
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
      this.externalIds,
      this.episodeRunTime,
      this.type,
      this.networks,
      this.seasons,
      this.numberOfSeason,
      this.numberOfEpisode,
      this.gender,
      this.knownFor,
      this.knownForDepartment,
      this.profilePath,
      this.combineCredits,
      this.biography,
      this.alsoKnownAs,
      this.birthday,
      this.placeOfBirth,
      this.mediaType});

  SearchItem.fromJson(dynamic json) {
    adult = json['adult'] ?? false;
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'] ?? 0;
    originalLanguage = json['original_language'] ?? "";
    originalTitle = json['original_title'] ?? "";
    overview = json['overview'] ?? "";
    popularity = json['popularity'] != null
        ? double.parse(json["popularity"].toString())
        : 0.0;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'] ?? false;
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'] ?? 0;
    firstAirDate = json['first_air_date'];
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
    episodeRunTime = json['episode_run_time'] != null
        ? json['episode_run_time'].cast<int>()
        : [];
    type = json['type'];
    if (json['networks'] != null) {
      networks = [];
      json['networks'].forEach((v) {
        networks?.add(NetworkItem.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = [];
      json['seasons'].forEach((v) {
        seasons?.add(SeasonItem.fromJson(v));
      });
    }
    numberOfSeason = json['number_of_seasons'];
    numberOfEpisode = json['number_of_episodes'];

    gender = json['gender'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(Results.fromJson(v));
      });
    }
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    combineCredits = json['combined_credits'] != null
        ? Credits.fromJson(json['combined_credits'])
        : null;
    biography = json['biography'];
    birthday = json['birthday'];
    alsoKnownAs = json['also_known_as'] != null
        ? json['also_known_as'].cast<String>()
        : [];
    placeOfBirth = json['place_of_birth'];
    mediaType = json['media_type'];
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
  List<int>? episodeRunTime;
  String? type;
  List<NetworkItem>? networks;
  List<SeasonItem>? seasons;
  int? numberOfSeason;
  int? numberOfEpisode;

  num? gender;
  List<Results>? knownFor;
  String? knownForDepartment;
  String? profilePath;
  Credits? combineCredits;
  String? biography;
  List<String>? alsoKnownAs;
  String? birthday;
  String? placeOfBirth;
  String? mediaType;

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
    map['episode_run_time'] = episodeRunTime;
    map['type'] = type;
    if (networks != null) {
      map['networks'] = networks?.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      map['seasons'] = seasons?.map((v) => v.toJson()).toList();
    }
    map['number_of_episodes'] = numberOfEpisode;
    map['number_of_seasons'] = numberOfSeason;

    map['gender'] = gender;
    if (knownFor != null) {
      map['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    map['known_for_department'] = knownForDepartment;
    map['profile_path'] = profilePath;
    if (combineCredits != null) {
      map['combined_credits'] = combineCredits?.toJson();
    }
    map['biography'] = biography;
    map['also_known_as'] = alsoKnownAs;
    map['birthday'] = birthday;
    map['place_of_birth'] = placeOfBirth;
    map['media_type'] = mediaType;
    return map;
  }
}

class StaticSearchItem {
  static List<SearchItem> jsonList(List<dynamic> mapList) {
    var list = <SearchItem>[];
    for (var e in mapList) {
      list.add(SearchItem.fromJson(e));
    }
    return list;
  }

  static List<SearchItem> get load {
    return [
      SearchItem(),
      SearchItem(),
      SearchItem(),
      SearchItem(),
      SearchItem(),
      SearchItem()
    ];
  }

  static List<SearchItem> get newData {
    return [];
  }
}
