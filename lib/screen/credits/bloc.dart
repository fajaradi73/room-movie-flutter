// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 03/02/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/detail/credits.dart';

class CreditsBloc extends GetxController
    with GetSingleTickerProviderStateMixin {
  Map<String, dynamic> argument = {};
  String title = "";
  late TabController tabController;
  Credits data = Credits();
  var scrollController = ScrollController();

  var showButton = false.obs;
  final List<Tab> myTabs = const [
    Tab(text: 'Aktor'),
    Tab(text: 'Kru'),
  ];

  @override
  void onInit() {
    super.onInit();
    argument.addAll(Get.arguments);
    title = argument.title;
    data = argument.credits;
    tabController = TabController(length: myTabs.length, vsync: this);
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

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
