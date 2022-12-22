/*
 * room_movie
 *     app_route.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:room_movie/screen/dashboard/dashboard_binding.dart';
import 'package:room_movie/screen/dashboard/dashboard_screen.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/screen/movie_detail/screen.dart';
import 'package:room_movie/screen/movie_list/movie_list_bloc.dart';
import 'package:room_movie/screen/movie_list/movie_list_screen.dart';
import 'package:room_movie/screen/serial_tv_list/serial_tv_list_screen.dart';

import '../screen/serial_tv_list/serial_tv_list_bloc.dart';
import '../screen/splash_screen/splash_screen.dart';

class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
        name: Pages.splashScreen,
        page: () => SplashScreen(),
        binding: BindingsBuilder(() {})),
    GetPage(
        name: Pages.dashboardScreen,
        page: () => DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
        name: Pages.movieListScreen,
        page: () => MovieListScreen(),
        binding: BindingsBuilder(() {
          Get.put(MovieListBloc());
        })),
    GetPage(
        name: Pages.movieDetailScreen,
        page: () => const MovieDetailScreen(),
        binding: BindingsBuilder(() {
          Get.put(MovieDetailBloc());
        })),
    GetPage(
        name: Pages.serialTvListScreen,
        page: () => SerialTvListScreen(),
        binding: BindingsBuilder(() {
          Get.put(SerialTvListBloc());
        })),
  ];
}

class Pages {
  static const splashScreen = "/splash_screen";
  static const dashboardScreen = "/dashboard_screen";
  static const movieListScreen = "/movie_list_screen";
  static const movieDetailScreen = "/movie_detail_Screen";
  static const serialTvListScreen = "/serial_tv_list_screen";
}
