// ignore_for_file: file_names
/*
 * 
 *     movie_detail_bloc
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

class MovieDetailBloc extends GetxController {
  var idMovie = 0;
  Map<String, dynamic> argument = {};
  final scrollController = ScrollController();
  var isShow = false.obs;
  var height = 32.0.height();
  var options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ];

  @override
  void onReady() {
    addScrollListener();
    argument.addAll(Get.arguments);
    idMovie = argument.idMovie;
  }

  void addScrollListener() {
    scrollController.addListener(() {
      isShow.value = scrollController.hasClients &&
          scrollController.offset > (height - kToolbarHeight);
      update();
    });
  }
}
