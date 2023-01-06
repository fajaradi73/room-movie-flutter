// ignore_for_file: file_names
/*
 * 
 *     Images
 *     Created by Fajar Adi Prasetyo on 23/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:room_movie/models/movie/detail/images_item.dart';

class Images {
  Images({
    this.backdrops,
    this.logos,
    this.posters,
  });

  Images.fromJson(dynamic json) {
    if (json['backdrops'] != null) {
      backdrops = [];
      json['backdrops'].forEach((v) {
        backdrops?.add(ImagesItem.fromJson(v));
      });
    }
    if (json['logos'] != null) {
      logos = [];
      json['logos'].forEach((v) {
        logos?.add(ImagesItem.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = [];
      json['posters'].forEach((v) {
        posters?.add(ImagesItem.fromJson(v));
      });
    }
  }

  List<ImagesItem>? backdrops;
  List<ImagesItem>? logos;
  List<ImagesItem>? posters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (backdrops != null) {
      map['backdrops'] = backdrops?.map((v) => v.toJson()).toList();
    }
    if (logos != null) {
      map['logos'] = logos?.map((v) => v.toJson()).toList();
    }
    if (posters != null) {
      map['posters'] = posters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class StaticImage {
  static List<ImagesItem> get newData {
    return [];
  }
}
