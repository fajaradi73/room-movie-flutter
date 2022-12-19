/*
 * room_movie
 *     dashboard_screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/artist/ArtistScreen.dart';
import 'package:room_movie/screen/home/home_screen.dart';
import 'package:room_movie/screen/main/dashboard_bloc.dart';
import 'package:room_movie/screen/movie/movie_screen.dart';
import 'package:room_movie/screen/serialTv/SerialTvScreen.dart';
import 'package:room_movie/screen/settings/SettingsScreen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final logic = Get.find<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: (logic.selectedNavBar.value == 4)
              ? AppBar(
                  elevation: 1,
                  title: const Text("Pengaturan"),
                )
              : searchBar(),
          body: SafeArea(
            child: IndexedStack(
              index: logic.selectedNavBar.value,
              children: const [
                HomeScreen(),
                MovieScreen(),
                SerialTvScreen(),
                ArtistScreen(),
                SettingsScreen()
              ],
            ),
          ),
          bottomNavigationBar: bottomNavigation(),
        ));
  }

  bottomNavigation() {
    return Obx(() => BottomNavigationBar(
          items: logic.bottomItem.map((element) {
            return BottomNavigationBarItem(
                icon: element.icon!, label: element.label);
          }).toList(),
          type: BottomNavigationBarType.fixed,
          currentIndex: logic.selectedNavBar.value,
          showUnselectedLabels: true,
          onTap: logic.changeSelectedBar,
        ));
  }

  searchBar() {
    return AppBar(
      elevation: 1,
      title: SizedBox(
        height: 45,
        child: Obx(
          () => TextField(
            onTap: () {},
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: logic.searchHint.value,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(Get.context!).primaryIconTheme.color,
                )),
          ),
        ),
      ),
    );
  }
}
