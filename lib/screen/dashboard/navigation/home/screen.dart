/*
 * room_movie
 *     screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/dashboard/navigation/home/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/home/widget/artist.dart';
import 'package:room_movie/screen/dashboard/navigation/home/widget/movie.dart';
import 'package:room_movie/screen/dashboard/navigation/home/widget/tv.dart';

class HomeScreen extends GetView<HomeBloc> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      onRefresh: () async {
        await controller.easyRefresh();
      },
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [HomeMovieWidget(), HomeTvWidget(), HomeArtistWidget()],
        ),
      )),
    );
  }
}
