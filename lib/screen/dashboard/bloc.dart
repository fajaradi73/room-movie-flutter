/*
 * room_movie
 *     bloc.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:room_movie/models/dashboard/bottom_navigation_list.dart';
import 'package:room_movie/models/enum/movie_type.dart';
import 'package:room_movie/models/enum/tv_type.dart';
import 'package:room_movie/screen/dashboard/navigation/artist/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/home/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/movie/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/serial_tv/bloc.dart';
import 'package:room_movie/screen/settings/bloc.dart';

import '../../models/enum/search_type.dart';

class DashboardBloc extends GetxController {
  var searchHint = "".obs;
  var selectedNavBar = 0.obs;
  var bottomItem = BottomNavigationList.items.obs;
  var movieType = MovieType.NULL.obs;
  var tvType = TvType.NULL.obs;
  var searchType = SearchType.NULL.obs;

  //// bloc
  final homeBloc = Get.find<HomeBloc>();
  final movieBloc = Get.find<MovieBloc>();
  final tvBloc = Get.find<SerialTvBloc>();
  final artistBloc = Get.find<ArtistBloc>();
  final settingsBloc = Get.find<SettingsBloc>();

  @override
  void onReady() {
    changeSelectedBar(selectedNavBar.value);
  }

  void changeSelectedBar(int index) {
    selectedNavBar.value = index;
    changeAppBar(index);
    openNavBar(index);
    update();
  }

  void openNavBar(int index) {
    if (index == 1) {
      movieBloc.openScreen();
    } else if (index == 2) {
      tvBloc.openScreen();
    } else if (index == 3) {
      artistBloc.openScreen();
    } else if (index == 4) {
      settingsBloc.openScreen();
    } else {
      homeBloc.openScreen();
    }
  }

  changeAppBar(index) {
    if (index == 0) {
      searchHint = "Search Movie, Serial Tv, Artist".obs;
      searchType.value = SearchType.ALL;
    } else if (index == 1) {
      searchHint = "Search Movie".obs;
      searchType.value = SearchType.MOVIE;
    } else if (index == 2) {
      searchHint = "Search Serial Tv".obs;
      searchType.value = SearchType.TV;
    } else if (index == 3) {
      searchHint = "Search Artist".obs;
      searchType.value = SearchType.ARTIST;
    }
  }
}
