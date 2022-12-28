// ignore_for_file: file_names
/*
 * 
 *     Credits
 *     Created by Fajar Adi Prasetyo on 23/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'credits_item.dart';

class Credits {
  Credits({
    this.cast,
    this.crew,
  });

  Credits.fromJson(dynamic json) {
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(CreditsItem.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(CreditsItem.fromJson(v));
      });
    }
  }

  List<CreditsItem>? cast;
  List<CreditsItem>? crew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
