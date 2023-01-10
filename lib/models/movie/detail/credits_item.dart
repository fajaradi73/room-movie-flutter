// ignore_for_file: file_names
/*
 * 
 *     cast
 *     Created by Fajar Adi Prasetyo on 23/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
class CreditsItem {
  CreditsItem(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order,
      this.department,
      this.job,
      this.voteCount,
      this.posterPath,
      this.title,
      this.mediaType,
      this.releaseDate,
      this.firstAirDate});

  CreditsItem.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    department = json['department'];
    job = json['job'];
    voteCount = json['vote_count'];
    posterPath = json['poster_path'];
    title = json['title'];
    mediaType = json['media_type'];
    releaseDate = json['release_date'];
    firstAirDate = json['first_air_date'];
  }

  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  num? castId;
  String? character;
  String? creditId;
  num? order;

  String? department;
  String? job;
  num? voteCount;
  String? posterPath;
  String? title;
  String? mediaType;
  String? firstAirDate;
  String? releaseDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    map['cast_id'] = castId;
    map['character'] = character;
    map['credit_id'] = creditId;
    map['order'] = order;
    map['department'] = department;
    map['job'] = job;
    map['vote_count'] = voteCount;
    map['poster_path'] = posterPath;
    map['title'] = title;
    map['media_type'] = mediaType;
    map['release_date'] = releaseDate;
    map['first_air_date'] = firstAirDate;
    return map;
  }
}
