// ignore_for_file: file_names
/*
 * 
 *     serial_tv_list_bloc
 *     Created by Fajar Adi Prasetyo on 21/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/tv_type.dart';

import '../../models/movie/Results.dart';
import '../../service/api_service.dart';
import '../../util/exception.dart';
import '../dashboard/bloc.dart';

class SerialTvListBloc extends GetxController {
  var isLoading = false.obs;
  var pageLoad = false.obs;
  var service = ApiService();
  var list = StaticResults.load.obs;
  var currentPage = 1.obs;
  var scrollController = ScrollController();
  var showButton = false.obs;

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  void onReady() {
    (this).getData(1);
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

  Future<void> getData(int index) async {
    index == 1 ? isLoading(true) : pageLoad(true);
    currentPage.value = index + 1;
    try {
      var res = await fetchAPI(index);
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
    index == 1 ? isLoading(false) : pageLoad(false);
  }

  fetchAPI(int page) {
    if (dashboardBloc.tvType.value.equal(TvType.RATING_TERATAS)) {
      return service.getTVTopRate(page);
    } else if (dashboardBloc.tvType.value.equal(TvType.TAYANG_DI_TV)) {
      return service.getTVOnTheAir(page);
    } else if (dashboardBloc.tvType.value.equal(TvType.SEDANG_TAYANG)) {
      return service.getTVToday(page);
    } else {
      return service.getTVPopular(page);
    }
  }
}
