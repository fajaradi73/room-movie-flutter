/*
 * room_movie
 *     HomeScreen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:room_movie/screen/widget/WidgetListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [widgetMovie(), widgetTv(), widgetArtist()],
      ),
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 260,
          child: WidgetListView(),
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
        const SizedBox(
          height: 260,
          child: WidgetListView(),
        )
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 260,
          child: WidgetListView(),
        )
      ],
    );
  }
}
