/*
 * room_movie
 *     ArtistResponse.dart
 *     Created by Fajar Adi Prasetyo on 16/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'artist_results.dart';

class ArtistResponse {
  ArtistResponse({
    this.page,
    required this.results,
  });

  ArtistResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(ArtistResults.fromJson(v));
      });
    }
  }
  int? page;
  late List<ArtistResults> results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['results'] = results.map((v) => v.toJson()).toList();
    return map;
  }
}
