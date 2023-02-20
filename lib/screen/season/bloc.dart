// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 20/02/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../models/movie/detail/season_item.dart';

class SeasonBloc extends GetxController {
  Map<String, dynamic> argument = {};
  String title = "";
  List<SeasonItem> listSeason = [];
  var scrollController = ScrollController();

  var showButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    argument.addAll(Get.arguments);
    title = argument.title;
    listSeason = argument.listSeason;
  }

  @override
  void onReady() {
    addScrollListener();
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
}
