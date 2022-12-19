// ignore_for_file: file_names

/*
 * room_movie
 *     movie_screen.dart
 *     Created by Fajar Adi Prasetyo on 24/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/movie/movie_bloc.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';

import 'movie_widget_list.dart';

class MovieScreen extends GetView<MovieBloc> {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.isLoading.value == true)
        ? const LoadingScreen()
        : ListView.builder(
            itemCount: controller.mapsMovie.length,
            itemBuilder: (BuildContext context, int index) {
              var key = controller.mapsMovie.keys.elementAt(index);
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
                            child: Text(
                              key,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: 270,
                    child: MovieWidgetList(controller.mapsMovie[key]!),
                  )
                ],
              );
            }));
  }
}
