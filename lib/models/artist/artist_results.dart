import 'package:room_movie/models/movie/detail/credits.dart';

import '../movie/Results.dart';
import '../movie/detail/external_ids.dart';

class ArtistResults {
  ArtistResults({
    bool? adult,
    num? gender,
    num? id,
    List<Results>? knownFor,
    String? knownForDepartment,
    String? name,
    num? popularity,
    String? profilePath,
    ExternalIds? externalIds,
    Credits? combineCredits,
    String? biography,
    List<String>? alsoKnownAs,
    String? birthday,
    String? placeOfBirth,
  }) {
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _popularity = popularity;
    _profilePath = profilePath;
    _externalIds = externalIds;
    _combineCredits = combineCredits;
    _biography = biography;
    _alsoKnownAs = alsoKnownAs;
    _birthday = birthday;
    _placeOfBirth = placeOfBirth;
  }

  ArtistResults.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(Results.fromJson(v));
      });
    }
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _externalIds = json['external_ids'] != null
        ? ExternalIds.fromJson(json['external_ids'])
        : null;
    _combineCredits = json['combined_credits'] != null
        ? Credits.fromJson(json['combined_credits'])
        : null;
    _biography = json['biography'];
    _birthday = json['birthday'];
    _alsoKnownAs = json['also_known_as'] != null
        ? json['also_known_as'].cast<String>()
        : [];
    _placeOfBirth = json['place_of_birth'];
  }

  bool? _adult;
  num? _gender;
  num? _id;
  List<Results>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  num? _popularity;
  String? _profilePath;
  ExternalIds? _externalIds;
  Credits? _combineCredits;
  String? _biography;
  List<String>? _alsoKnownAs;
  String? _birthday;
  String? _placeOfBirth;

  bool? get adult => _adult;

  num? get gender => _gender;

  num? get id => _id;

  List<Results>? get knownFor => _knownFor;

  String? get knownForDepartment => _knownForDepartment;

  String? get name => _name;

  num? get popularity => _popularity;

  String? get profilePath => _profilePath;

  ExternalIds? get externalIds => _externalIds;

  Credits? get combineCredits => _combineCredits;

  String? get biography => _biography;

  List<String>? get alsoKnownAs => _alsoKnownAs;

  String? get birthday => _birthday;

  String? get placeOfBirth => _placeOfBirth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    if (_knownFor != null) {
      map['known_for'] = _knownFor?.map((v) => v.toJson()).toList();
    }
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    if (_externalIds != null) {
      map['external_ids'] = _externalIds?.toJson();
    }
    if (_combineCredits != null) {
      map['combined_credits'] = _combineCredits?.toJson();
    }
    map['biography'] = _biography;
    map['also_known_as'] = _alsoKnownAs;
    map['birthday'] = _birthday;
    map['place_of_birth'] = _placeOfBirth;
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
