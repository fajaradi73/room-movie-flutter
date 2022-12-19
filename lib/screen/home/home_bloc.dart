/*
 * room_movie
 *     home_bloc.dart
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
import 'package:room_movie/service/ApiService.dart';

import '../../models/genre/Genre.dart';
import '../../service/exception.dart';
import '../../util/Util.dart';

class HomeBloc extends GetxController {
  var listMovie = StaticResults.load.obs;
  var listTv = StaticResults.load.obs;
  var listArtist = StaticArtistResults.load.obs;

  var isLoading = true.obs;
  var service = ApiService();

  @override
  void onReady() {
    (this).getMovie();
    (this).getSerialTv();
    (this).getArtist();
  }

  Future<void> getMovie() async {
    isLoading(true);
    try {
      var res = await service.getMoviePopular(1);
      if (res != null && res.results.isNotEmpty) {
        listMovie.rxNew(res.results);
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

  Future<void> getSerialTv() async {
    isLoading(true);
    try {
      var res = await service.getTVPopular(1);
      if (res != null && res.results.isNotEmpty) {
        listTv.rxNew(res.results);
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

  _getGenreName(int id, bool isMovie) async {
    var genre = "";
    List<Genre> listGenre = [];
    var parse = await parseListJsonFromAssets("assets/json/genre_tv.json");
    if (isMovie) {
      parse = await parseListJsonFromAssets("assets/json/genre_movie.json");
    }
    listGenre = List<Genre>.from(parse.map((e) => Genre.fromJson(e)));
    for (var data in listGenre) {
      if (data.id == id) {
        genre = data.name ?? "";
      }
    }
    return genre;
  }

  Future<String> getGenre(List<int>? listId, bool isMovie) async {
    String nameGenre = "";
    if (listId != null) {
      for (int i = 0; i < listId.length; i++) {
        String name = await _getGenreName(listId[i], isMovie);
        if (name.isNotEmpty) {
          if (i == (listId.length - 1)) {
            nameGenre = nameGenre + name;
          } else {
            nameGenre = "$nameGenre$name • ";
          }
        }
      }
    }
    return nameGenre;
  }

  Future<String> getKnowFor(List<Results>? list) async {
    String knowFor = "";
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i == list.length - 1) {
          knowFor += list[i].title == null || list[i].title?.isEmpty == true
              ? "${list[i].name}"
              : "${list[i].title}";
        } else {
          knowFor += list[i].title == null || list[i].title?.isEmpty == true
              ? ("${list[i].name}, ")
              : "${list[i].title}, ";
        }
      }
    }
    return knowFor;
  }
}
