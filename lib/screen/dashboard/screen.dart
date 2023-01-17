/*
 * room_movie
 *     screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/home/screen.dart';
import 'package:room_movie/screen/dashboard/navigation/movie/screen.dart';
import 'package:room_movie/screen/dashboard/navigation/serial_tv/screen.dart';
import 'package:room_movie/screen/settings/screen.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';

import '../../router/app_route.dart';
import '../dashboard/navigation/artist/bloc.dart';
import 'navigation/artist/screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final logic = Get.find<DashboardBloc>();
  final artistLogic = Get.find<ArtistBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureScaffold(
          appBar: (logic.selectedNavBar.value == 4)
              ? AppBar(
                  elevation: 1,
                  title: const Text("Pengaturan"),
                )
              : searchBar(context),
          body: IndexedStack(
            index: logic.selectedNavBar.value,
            children: [
              const HomeScreen(),
              MovieScreen(),
              SerialTvScreen(),
              const ArtistScreen(),
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

  searchBar(context) {
    return AppBar(
      elevation: 1,
      titleSpacing: 5,
      title: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: Obx(() {
          return TextField(
            onTap: () {
              Get.toNamed(Pages.searchScreen,
                  arguments: {"search_type": logic.searchType.value});
            },
            textAlignVertical: TextAlignVertical.center,
            readOnly: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: logic.searchHint.value,
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryIconTheme.color,
                )),
          );
        }),
      ),
    );
  }
}
