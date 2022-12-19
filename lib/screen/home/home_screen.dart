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
import 'package:room_movie/screen/home/home_artist_widget.dart';
import 'package:room_movie/screen/home/home_bloc.dart';
import 'package:room_movie/screen/home/home_movie_widget.dart';
import 'package:room_movie/screen/home/home_tv_widget.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';

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
                children: [
                  HomeMovieWidget(),
                  HomeTvWidget(),
                  HomeArtistWidget()
                ],
              ),
            )),
    );
  }
}
