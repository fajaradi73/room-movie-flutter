class SeasonItem {
  SeasonItem({
    String? airDate,
    num? episodeCount,
    num? id,
    String? name,
    String? overview,
    String? posterPath,
    num? seasonNumber,
  }) {
    _airDate = airDate;
    _episodeCount = episodeCount;
    _id = id;
    _name = name;
    _overview = overview;
    _posterPath = posterPath;
    _seasonNumber = seasonNumber;
  }

  SeasonItem.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeCount = json['episode_count'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _seasonNumber = json['season_number'];
  }
  String? _airDate;
  num? _episodeCount;
  num? _id;
  String? _name;
  String? _overview;
  String? _posterPath;
  num? _seasonNumber;

  String? get airDate => _airDate;
  num? get episodeCount => _episodeCount;
  num? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  num? get seasonNumber => _seasonNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_count'] = _episodeCount;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['season_number'] = _seasonNumber;
    return map;
  }
}
