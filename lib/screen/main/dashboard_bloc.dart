/*
 * room_movie
 *     dashboard_bloc.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:room_movie/models/dashboard/bottom_navigation_list.dart';

class DashboardBloc extends GetxController {
  var searchHint = "".obs;
  var selectedNavBar = 0.obs;
  var bottomItem = BottomNavigationList.items.obs;

  @override
  void onReady() {
    changeSelectedBar(selectedNavBar.value);
  }

  void changeSelectedBar(int index) {
    selectedNavBar.value = index;
    changeAppBar(selectedNavBar);
    update();
  }

  changeAppBar(index) {
    if (index == 0) {
      searchHint = "Search Movie, Serial Tv, Artist".obs;
    } else if (index == 3) {
      searchHint = "Search Artist".obs;
    } else if (index == 2) {
      searchHint = "Search Serial Tv".obs;
    } else if (index == 1) {
      searchHint = "Search Movie".obs;
    }
  }
}
