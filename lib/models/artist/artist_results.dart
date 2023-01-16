import 'package:room_movie/models/movie/detail/credits.dart';

import '../movie/Results.dart';
import '../movie/detail/external_ids.dart';

class ArtistResults {
  ArtistResults({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
    this.externalIds,
    this.combineCredits,
    this.biography,
    this.alsoKnownAs,
    this.birthday,
    this.placeOfBirth,
  });

  ArtistResults.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(Results.fromJson(v));
      });
    }
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    externalIds = json['external_ids'] != null
        ? ExternalIds.fromJson(json['external_ids'])
        : null;
    combineCredits = json['combined_credits'] != null
        ? Credits.fromJson(json['combined_credits'])
        : null;
    biography = json['biography'];
    birthday = json['birthday'];
    alsoKnownAs = json['also_known_as'] != null
        ? json['also_known_as'].cast<String>()
        : [];
    placeOfBirth = json['place_of_birth'];
  }

  bool? adult;
  num? gender;
  num? id;
  List<Results>? knownFor;
  String? knownForDepartment;
  String? name;
  num? popularity;
  String? profilePath;
  ExternalIds? externalIds;
  Credits? combineCredits;
  String? biography;
  List<String>? alsoKnownAs;
  String? birthday;
  String? placeOfBirth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    if (knownFor != null) {
      map['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    if (externalIds != null) {
      map['external_ids'] = externalIds?.toJson();
    }
    if (combineCredits != null) {
      map['combined_credits'] = combineCredits?.toJson();
    }
    map['biography'] = biography;
    map['also_known_as'] = alsoKnownAs;
    map['birthday'] = birthday;
    map['place_of_birth'] = placeOfBirth;
    return map;
  }
}

class StaticArtistResults {
  static List<ArtistResults> jsonList(List<dynamic> mapList) {
    var list = <ArtistResults>[];
    for (var e in mapList) {
      list.add(ArtistResults.fromJson(e));
    }
    return list;
  }

  static List<ArtistResults> get load {
    return [
      ArtistResults(),
      ArtistResults(),
      ArtistResults(),
      ArtistResults(),
      ArtistResults(),
      ArtistResults()
    ];
  }

  static List<ArtistResults> get newData {
    return [];
  }
}
