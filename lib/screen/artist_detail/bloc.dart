// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 10/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';

import '../../gen_theme/assets.gen.dart';
import '../../models/movie/detail/credits_item.dart';
import '../../models/movie/detail/external_ids.dart';
import '../../service/api_service.dart';
import '../../util/exception.dart';

class ArtistDetailBloc extends GetxController {
  var idResults = 0;
  Map<String, dynamic> argument = {};
  final scrollController = ScrollController();
  var isShow = false.obs;
  var height = 32.0.height();
  var data = ArtistResults().obs;

  var isLoading = true.obs;
  var service = ApiService();

  RxMap<dynamic, dynamic> mapsExternalIds = {}.obs;

  @override
  void onReady() {
    addScrollListener();
    argument.addAll(Get.arguments);
    idResults = argument.idResults;
    (this).getArtistDetail(idResults);
  }

  void addScrollListener() {
    scrollController.addListener(() {
      isShow.value = scrollController.hasClients &&
          scrollController.offset > (height - kToolbarHeight);
      update();
    });
  }

  Future<void> getArtistDetail(int id) async {
    isLoading(true);
    try {
      var res = await service.getArtistDetail(id);
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
    }
    isLoading(false);
  }

  String getGender(id) {
    var gender = "";
    switch (id) {
      case 1:
        gender = "Wanita";
        break;
      case 2:
        gender = "Pria";
        break;
      default:
        gender = "Unspecified (not set)";
    }
    return gender;
  }

  String getKnownAs(List<String>? list) {
    var knownAs = "";
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i == list.length - 1) {
          knownAs += list[i];
        } else {
          knownAs += "${list[i]} \n";
        }
      }
    }
    return knownAs;
  }

  int getKnownCredits(List<CreditsItem>? list) {
    var total = 0;
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        var item = list[i];
        if (item.voteCount != null && item.voteCount! > 0) {
          total += 1;
        }
      }
    }
    return total;
  }

  List<CreditsItem>? getKnownFor(
      {String? department, List<CreditsItem>? data}) {
    var list = <CreditsItem>[];
    if (data != null) {
      for (var item in data) {
        if (item.department == department) {
          list.add(item);
        }
      }
    }
    return list;
  }

  List<CreditsItem>? listCasting(data) {
    var list = <CreditsItem>[];
    if (data != null && data?.isNotEmpty == true) {
      list.addAll(data!);
      list.sort(
        (a, b) => sortYear(a, b),
      );
    }
    return list;
  }

  List<CreditsItem>? listPeran(data) {
    var list = <CreditsItem>[];
    if (data != null && data?.isNotEmpty == true) {
      list.addAll(data!);
      list.sort((a, b) => b.voteCount!.compareTo(a.voteCount ?? 0));
    }
    return list;
  }

  int sortYear(CreditsItem a, CreditsItem b) {
    final propertyA = (a.releaseDate ?? a.firstAirDate)
        .toDate("yyyy-MM-dd")
        ?.millisecondsSinceEpoch;
    final propertyB = (b.releaseDate ?? b.firstAirDate)
        .toDate("yyyy-MM-dd")
        ?.millisecondsSinceEpoch;
    int result;
    if (propertyA == null) {
      result = -1;
    } else if (propertyB == null) {
      result = 1;
    } else {
      result = propertyB.compareTo(propertyA);
    }
    return result;
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
