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
import 'package:room_movie/screen/artist/artist_screen.dart';
import 'package:room_movie/screen/dashboard/dashboard_bloc.dart';
import 'package:room_movie/screen/home/home_screen.dart';
import 'package:room_movie/screen/movie/movie_screen.dart';
import 'package:room_movie/screen/serialTv/serial_tv_screen.dart';
import 'package:room_movie/screen/settings/SettingsScreen.dart';

import '../artist/artist_bloc.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final logic = Get.find<DashboardBloc>();
  final artistLogic = Get.find<ArtistBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: (logic.selectedNavBar.value == 4)
              ? AppBar(
                  elevation: 1,
                  title: const Text("Pengaturan"),
                )
              : searchBar(),
          body: IndexedStack(
            index: logic.selectedNavBar.value,
            children: [
              HomeScreen(),
              MovieScreen(),
              SerialTvScreen(),
              ArtistScreen(),
              SettingsScreen()
            ],
          ),
          bottomNavigationBar: bottomNavigation(),
          floatingActionButton: (logic.selectedNavBar.value == 3)
              ? AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  //show/hide animation
                  opacity: artistLogic.showButton.value ? 1.0 : 0.0,
                  //set obacity to 1 on visible, or hide
                  child: FloatingActionButton(
                    onPressed: () {
                      artistLogic.scrollController.animateTo(
                          //go to top of scroll
                          0, //scroll offset to go
                          duration: const Duration(milliseconds: 500),
                          //duration of scroll
                          curve: Curves.fastOutSlowIn //scroll type
                          );
                    },
                    child: const Icon(Icons.arrow_upward),
                  ),
                )
              : null,
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
