// ignore_for_file: file_names
/*
 * 
 *     keywords
 *     Created by Fajar Adi Prasetyo on 23/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:room_movie/models/movie/detail/keyword_item.dart';

class Keywords {
  Keywords({this.keywords, this.results});

  Keywords.fromJson(dynamic json) {
    if (json['keywords'] != null) {
      keywords = [];
      json['keywords'].forEach((v) {
        keywords?.add(KeywordItem.fromJson(v));
      });
    }
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(KeywordItem.fromJson(v));
      });
    }
  }
  List<KeywordItem>? keywords;
  List<KeywordItem>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (keywords != null) {
      map['keywords'] = keywords?.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
