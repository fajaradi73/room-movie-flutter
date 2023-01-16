// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 16/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:room_movie/models/search/search_item.dart';

class SearchResponse {
  SearchResponse({
    this.page,
    required this.results,
  });

  SearchResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(SearchItem.fromJson(v));
      });
    }
  }
  int? page;
  late List<SearchItem> results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['results'] = results.map((v) => v.toJson()).toList();
    return map;
  }
}
