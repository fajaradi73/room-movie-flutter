/*
 * room_movie
 *     bloc.dart
 *     Created by Fajar Adi Prasetyo on 16/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/service/api_service.dart';

import '../../util/exception.dart';

class HomeBloc extends GetxController {
  var listMovie = StaticResults.load.obs;
  var listTv = StaticResults.load.obs;
  var listArtist = StaticArtistResults.load.obs;

  var isLoading = false.obs;
  var service = ApiService();
  var isFirstOpen = true;

  void openScreen() {
    if (isFirstOpen) {
      (this).getMovie();
      isFirstOpen = false;
    }
  }

  Future<void> getMovie() async {
    isLoading(true);
    try {
      var res = await service.getMoviePopular(1);
      if (res != null && res.results.isNotEmpty) {
        listMovie.rxNew(res.results);
        (this).getSerialTv();
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
      isLoading(false);
    }
  }

  Future<void> getSerialTv() async {
    isLoading(true);
    try {
      var res = await service.getTVPopular(1);
      if (res != null && res.results.isNotEmpty) {
        listTv.rxNew(res.results);
        (this).getArtist();
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
      isLoading(false);
    }
  }

  Future<void> getArtist() async {
    isLoading(true);
    try {
      var res = await service.getArtistPopular(1);
      if (res != null && res.results.isNotEmpty) {
        listArtist.rxNew(res.results);
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
