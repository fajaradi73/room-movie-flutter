// ignore_for_file: file_names

/*
 * room_movie
 *     Genre.dart
 *     Created by Fajar Adi Prasetyo on 31/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

class Genre {
  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
