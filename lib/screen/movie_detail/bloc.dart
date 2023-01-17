// ignore_for_file: file_names
/*
 * 
 *     movie_detail_bloc
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/models/movie/detail/external_ids.dart';
import 'package:room_movie/models/movie/detail/keyword_item.dart';
import 'package:room_movie/models/movie/detail/spoken_languages.dart';
import 'package:room_movie/util/logger.dart';

import '../../gen_theme/assets.gen.dart';
import '../../models/movie/detail/genres.dart';
import '../../service/api_service.dart';
import '../../util/exception.dart';

class MovieDetailBloc extends GetxController {
  var idMovie = 0;
  Map<String, dynamic> argument = {};
  final scrollController = ScrollController();
  var isShow = false.obs;
  var height = 32.0.height();
  var data = Results().obs;

  var isLoading = true.obs;
  var service = ApiService();

  RxMap<dynamic, dynamic> mapsExternalIds = {}.obs;

  @override
  void onReady() {
    addScrollListener();
    argument.addAll(Get.arguments);
    idMovie = argument.idResults;
    (this).getMovieDetail(idMovie);
  }

  void addScrollListener() {
    scrollController.addListener(() {
      isShow.value = scrollController.hasClients &&
          scrollController.offset > (height - kToolbarHeight);
      update();
    });
  }

  Future<void> getMovieDetail(int id) async {
    isLoading(true);
    try {
      var res = await service.getMovieDetail(id);
      if (res != null) {
        data.value = res;
        getExternalIds(data.value.externalIds);
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
      Logger.e("errorMovie", ex: e);
    }
    isLoading(false);
  }

  String getGenre(List<Genres>? list) {
    var genre = "";
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        var name = list[i].name ?? "";
        if (name.isNotEmpty) {
          if (i != (list.length - 1)) {
            genre += "$name, ";
          } else {
            genre += name;
          }
        }
      }
    }
    return genre;
  }

  String getLanguage(String? string, List<SpokenLanguages>? list) {
    var language = "";
    if (list != null) {
      for (var data in list) {
        if (data.iso6391 == string) {
          language = data.name ?? "";
          break;
        }
      }
    }
    return language;
  }

  KeywordItem getKeyword(List<KeywordItem>? list, int id) {
    KeywordItem item = KeywordItem();
    if (list != null) {
      for (var data in list) {
        if (data.id == id) {
          item = data;
          break;
        }
      }
    }
    return item;
  }

  Future<void> getExternalIds(ExternalIds? item) async {
    if (item != null) {
      if (item.wikidataId != null && item.wikidataId?.isNotEmpty == true) {
        mapsExternalIds.addEntries({
          "wikipedia": {
            "id": "https://wikidata.org/wiki/${item.wikidataId}",
            "icon": Assets.svg.wikipedia.svg()
          }
        }.entries);
      }
      if (item.facebookId != null && item.facebookId?.isNotEmpty == true) {
        mapsExternalIds.addEntries({
          "facebook": {
            "id": "https://www.facebook.com/${item.facebookId}",
            "icon": Assets.svg.facebook.svg()
          }
        }.entries);
      }
      if (item.twitterId != null && item.twitterId?.isNotEmpty == true) {
        mapsExternalIds.addEntries({
          "twitter": {
            "id": "http://twitter.com/${item.twitterId}",
            "icon": Assets.svg.twitter.svg()
          }
        }.entries);
      }
      if (item.instagramId != null && item.instagramId?.isNotEmpty == true) {
        mapsExternalIds.addEntries({
          "instagram": {
            "id": "http://instagram.com/${item.instagramId}",
            "icon": Assets.svg.instagram.svg()
          }
        }.entries);
      }
      if (item.imdbId != null && item.imdbId?.isNotEmpty == true) {
        mapsExternalIds.addEntries({
          "imdb": {
            "id": "https://www.imdb.com/title/${item.imdbId}",
            "icon": Assets.svg.imdb.svg()
          }
        }.entries);
      }
    }
  }
}
