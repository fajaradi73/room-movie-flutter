// ignore_for_file: file_names

/*
 * room_movie
 *     movie_bloc.dart
 *     Created by Fajar Adi Prasetyo on 19/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../models/movie/Results.dart';
import '../../service/ApiService.dart';
import '../../util/exception.dart';

class MovieBloc extends GetxController {
  final mapsMovie = <String, List<Results>>{
    "Popular": [],
    "Sedang Tayang": [],
    "Rating Teratas": [],
    "Mendatang": [],
    "Sedang Tren": []
  }.obs;

  var isLoading = true.obs;
  var service = ApiService();
  var listPopular = StaticResults.load.obs;
  var listNowPlaying = StaticResults.load.obs;
  var listTopRated = StaticResults.load.obs;
  var listTrending = StaticResults.load.obs;
  var listUpcoming = StaticResults.load.obs;

  @override
  void onReady() {
    (this).getMoviePopular();
    (this).getMovieTopRated();
    (this).getMovieNowPlaying();
    (this).getMovieTrending();
    (this).getMovieUpcoming();
  }

  Future<void> getMoviePopular() async {
    isLoading(true);
    try {
      var res = await service.getMoviePopular(1);
      if (res != null && res.results.isNotEmpty) {
        listPopular.rxNew(res.results);
        mapsMovie["Popular"] = listPopular;
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

  Future<void> getMovieTopRated() async {
    isLoading(true);
    try {
      var res = await service.getMovieTopRated(1);
      if (res != null && res.results.isNotEmpty) {
        listTopRated.rxNew(res.results);
        mapsMovie["Rating Teratas"] = listTopRated;
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

  Future<void> getMovieTrending() async {
    isLoading(true);
    try {
      var res = await service.getMovieTrending(1);
      if (res != null && res.results.isNotEmpty) {
        listTrending.rxNew(res.results);
        mapsMovie["Sedang Tren"] = listTrending;
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

  Future<void> getMovieNowPlaying() async {
    isLoading(true);
    try {
      var res = await service.getMovieNow(1);
      if (res != null && res.results.isNotEmpty) {
        listNowPlaying.rxNew(res.results);
        mapsMovie["Sedang Tayang"] = listNowPlaying;
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

  Future<void> getMovieUpcoming() async {
    isLoading(true);
    try {
      var res = await service.getMovieUpcoming(1);
      if (res != null && res.results.isNotEmpty) {
        listUpcoming.rxNew(res.results);
        mapsMovie["Mendatang"] = listUpcoming;
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
}
