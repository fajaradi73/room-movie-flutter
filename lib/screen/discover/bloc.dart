// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 17/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/service/api_service.dart';
import 'package:room_movie/util/exception.dart';

class DiscoverBloc extends GetxController {
  var id = 0;
  Map<String, dynamic> argument = {};
  final scrollController = ScrollController();
  var isShow = false.obs;
  var pageLoad = false.obs;
  var currentPage = 1.obs;
  var showButton = false.obs;

  var isMovie = true.obs;
  var title = "".obs;
  var sortBy = "popularity.desc".obs;
  var genre = "".obs;
  var keyword = "".obs;
  var network = "".obs;

  var service = ApiService();
  var list = StaticResults.newData.obs;

  var typeItems = ['Film', 'Serial TV'];
  var populartyItems = ['Populer', 'Tidak Populer'];
  var rattingItems = ['Tertinggi', 'Terendah'];
  var dateItems = ['Terbaru', 'Terlama'];
  var dropDownValue = "Film".obs;
  var isDisable = false.obs;

  @override
  void onReady() {
    addScrollListener();
    argument.addAll(Get.arguments);
    isMovie.value = argument.isMovie;
    title.value = argument.title;
    sortBy.value = argument.sortBy ?? "popularity.desc";
    genre.value = argument.genre;
    keyword.value = argument.keyword;
    network.value = argument.network;
    (this).getDiscover(currentPage.value, sortBy.value, genre.value,
        keyword.value, network.value);

    dropDownValue.value = (isMovie.value) ? "Film" : "Serial TV";
    if (network.isNotEmpty) {
      isDisable.value = true;
    }
  }

  addScrollListener() {
    scrollController.addListener(() {
      //scroll listener
      double showOffSet = 10.0;

      if (scrollController.offset > showOffSet) {
        showButton.value = true;
      } else {
        showButton.value = false;
      }
      update();
    });
  }

  Future<void> getDiscover(int index, String sortBy, String genre,
      String keyword, String network) async {
    pageLoad(true);
    currentPage.value = index + 1;
    try {
      var res = await fetchApi(index, sortBy, genre, keyword, network);
      if (res != null && res.results.isNotEmpty) {
        if (index == 1) {
          list.rxNew(res.results);
        } else {
          list.rxAddAll(res.results);
        }
      }
    } catch (e) {
      currentPage.value = index == 1 ? index : index - 1;
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    pageLoad(false);
  }

  fetchApi(
      int page, String sortBy, String genre, String keyword, String network) {
    if (isMovie.value) {
      return service.getDiscoverMovie(page, sortBy, genre, keyword);
    } else {
      return service.getDiscoverTv(page, sortBy, genre, keyword, network);
    }
  }
}
