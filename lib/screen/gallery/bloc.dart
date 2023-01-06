// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../models/movie/detail/images_item.dart';
import '../../models/movie/detail/videos.dart';

class GalleryBloc extends GetxController {
  var scrollController = ScrollController();
  var showButton = false.obs;
  List<ImagesItem> listImages = [];
  List<VideosItem> listVideo = [];
  String title = "";
  double ratio = 0;
  Map<String, dynamic> argument = {};

  @override
  void onInit() {
    super.onInit();
    argument.addAll(Get.arguments);
    listImages = argument.listImage;
    listVideo = argument.listVideo;
    title = argument.title;
    ratio = argument.ratio;
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
