/*
 * room_movie
 *     home_screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/artist/artist_list_view.dart';
import 'package:room_movie/screen/home/home_bloc.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';
import 'package:room_movie/screen/widget/WidgetListView.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final logic = Get.find<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => (logic.isLoading.value == true)
          ? const LoadingScreen()
          : SingleChildScrollView(
              child: Column(
                children: [widgetMovie(), widgetTv(), widgetArtist()],
              ),
            )),
    );
  }

  widgetMovie() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Popular Movie",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
          child: WidgetListView(logic.listMovie, true),
        )
      ],
    );
  }

  widgetTv() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Popular Serial Tv",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        Container(
            constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
            child: WidgetListView(logic.listTv, false)),
      ],
    );
  }

  widgetArtist() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Popular Artist",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
          child: ArtistListView(logic.listArtist),
        )
      ],
    );
  }
}
