import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';

import '../../service/ApiService.dart';
import '../../util/exception.dart';

class ArtistBloc extends GetxController {
  var isLoading = false.obs;
  var pageLoad = false.obs;
  var currentPage = 1.obs;

  var service = ApiService();

  var scrollController = ScrollController();
  var showButton = false.obs;
  final listArtist = StaticArtistResults.load.obs;

  void openScreen() {
    (this).getArtist(1);
    addScrollListener();
  }

  Future<void> getArtist(int index) async {
    index == 1 ? isLoading(true) : pageLoad(true);
    currentPage.value = index + 1;
    try {
      var res = await service.getArtistPopular(index);
      if (res != null && res.results.isNotEmpty) {
        if (index == 1) {
          listArtist.rxNew(res.results);
        } else {
          listArtist.rxAddAll(res.results);
        }
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    index == 1 ? isLoading(false) : pageLoad(false);
  }

  addScrollListener() {
    scrollController.addListener(() {
      //scroll listener
      double showOffSet =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showOffSet) {
        showButton.value = true;
      } else {
        showButton.value = false;
      }
      update();
    });
  }
}
