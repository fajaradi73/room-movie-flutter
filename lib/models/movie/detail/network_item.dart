// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

class NetworkItem {
  NetworkItem({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });

  NetworkItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo_path'] = logoPath;
    map['origin_country'] = originCountry;
    return map;
  }
}
