import '../movie/Results.dart';

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
  }) {
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _popularity = popularity;
    _profilePath = profilePath;
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
  }

  bool? _adult;
  num? _gender;
  num? _id;
  List<Results>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  num? _popularity;
  String? _profilePath;

  ArtistResults copyWith({
    bool? adult,
    num? gender,
    num? id,
    List<Results>? knownFor,
    String? knownForDepartment,
    String? name,
    num? popularity,
    String? profilePath,
  }) =>
      ArtistResults(
        adult: adult ?? _adult,
        gender: gender ?? _gender,
        id: id ?? _id,
        knownFor: knownFor ?? _knownFor,
        knownForDepartment: knownForDepartment ?? _knownForDepartment,
        name: name ?? _name,
        popularity: popularity ?? _popularity,
        profilePath: profilePath ?? _profilePath,
      );

  bool? get adult => _adult;

  num? get gender => _gender;

  num? get id => _id;

  List<Results>? get knownFor => _knownFor;

  String? get knownForDepartment => _knownForDepartment;

  String? get name => _name;

  num? get popularity => _popularity;

  String? get profilePath => _profilePath;

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
