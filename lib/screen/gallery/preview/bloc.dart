// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../../models/movie/detail/images_item.dart';

class PreviewBloc extends GetxController {
  Map<String, dynamic> argument = {};
  List<ImagesItem> list = [];
  var currentIndex = 0.obs;
  PageController? pageController;
  var isDetail = false;

  @override
  void onInit() {
    super.onInit();
    argument.addAll(Get.arguments);
    list = argument.listImage;
    currentIndex.value = argument.currentIndex;
    isDetail = argument.isDetail;
    pageController = PageController(initialPage: currentIndex.value);
  }

  void onPageChange(int index) {
    currentIndex.value = index;
    update();
  }
}
