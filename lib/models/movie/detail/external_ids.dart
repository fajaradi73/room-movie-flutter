// ignore_for_file: file_names
/*
 * 
 *     external_ids
 *     Created by Fajar Adi Prasetyo on 23/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
class ExternalIds {
  String? imdbId;
  String? twitterId;
  String? facebookId;
  String? instagramId;
  String? wikidataId;

  ExternalIds(
      {this.imdbId,
      this.twitterId,
      this.facebookId,
      this.instagramId,
      this.wikidataId});
  ExternalIds.fromJson(dynamic json) {
    imdbId = json['imdb_id'];
    twitterId = json['twitter_id'];
    facebookId = json['facebook_id'];
    instagramId = json['instagram_id'];
    wikidataId = json['wikidata_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imdb_id'] = imdbId;
    map['twitter_id'] = twitterId;
    map['facebook_id'] = facebookId;
    map['instagram_id'] = instagramId;
    map["wikidata_id"] = wikidataId;
    return map;
  }
}
