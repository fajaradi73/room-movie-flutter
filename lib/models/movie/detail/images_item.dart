// ignore_for_file: file_names
/*
 * 
 *     ImagesItem
 *     Created by Fajar Adi Prasetyo on 23/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
class ImagesItem {
  double? aspectRatio;
  String? filePath;
  double? voteAverage;
  int? width;
  String? iso6391;
  int? voteCount;
  int? height;

  ImagesItem(
      {this.aspectRatio,
      this.filePath,
      this.voteAverage,
      this.width,
      this.iso6391,
      this.voteCount,
      this.height});

  ImagesItem.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    width = json['width'];
    iso6391 = json['iso_639_1'];
    voteCount = json['vote_count'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = aspectRatio;
    map['file_path'] = filePath;
    map['vote_average'] = voteAverage;
    map['width'] = width;
    map["iso_639_1"] = iso6391;
    map['vote_count'] = voteCount;
    map["height"] = height;
    return map;
  }
}
