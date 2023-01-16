// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/search_type.dart';

import '../../router/app_route.dart';
import '../../service/api_service.dart';
import '../../util/exception.dart';

class SearchBloc extends GetxController {
  var isKeyboardVisible = false;
  var isLoading = true.obs;
  var pageLoad = false.obs;
  var showButton = false.obs;
  var currentPage = 1.obs;
  var searchValue = "".obs;

  // var listResults = StaticResults.newData.obs;
  // var listArtist = StaticArtistResults.newData.obs;
  // var listMulti = StaticSearchItem.newData.obs;
  var searchType = SearchType.ALL;
  var list = [].obs;

  var service = ApiService();
  var scrollController = ScrollController();
  var textController = TextEditingController();
  var focusNode = FocusNode();

  Map<String, dynamic> argument = {};

  @override
  void onReady() {
    addScrollListener();
    argument.addAll(Get.arguments);
    searchType = argument.searchType;
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

  Future<void> getSearch(int index, String value) async {
    // index == 1 ? isLoading(true) :
    pageLoad(true);
    currentPage.value = index + 1;
    try {
      var res = await fetchApi(index, value);
      if (res != null && res.results.isNotEmpty) {
        if (index == 1) {
          // listResults.rxNew(res.results);
          list.rxNew(res.results);
        } else {
          // listResults.rxAddAll(res.results);
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
    // index == 1 ? isLoading(false) :
    pageLoad(false);
  }

  fetchApi(page, value) {
    if (searchType == SearchType.MOVIE) {
      return service.getSearchMovie(page, value);
    } else if (searchType == SearchType.TV) {
      return service.getSearchTv(page, value);
    } else if (searchType == SearchType.ARTIST) {
      return service.getSearchArtist(page, value);
    } else {
      return service.getSearchMulti(page, value);
    }
  }

  getPageName(String? type) {
    if (type.equal("movie")) {
      return Pages.movieDetailScreen;
    } else if (type.equal("tv")) {
      return Pages.serialTvDetailScreen;
    } else {
      return Pages.artistDetailScreen;
    }
  }
}
