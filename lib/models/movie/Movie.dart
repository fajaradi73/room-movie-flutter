// ignore_for_file: file_names
/*
 * room_movie
 *     Movie.dart
 *     Created by Fajar Adi Prasetyo on 31/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'Results.dart';

class Movie {
  Movie({
    this.page,
    required this.results,
  });

  Movie.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }
  int? page;
  late List<Results> results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['results'] = results.map((v) => v.toJson()).toList();
    return map;
  }
}
