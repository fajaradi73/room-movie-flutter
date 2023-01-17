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
import 'package:room_movie/screen/artist_detail/bloc.dart';
import 'package:room_movie/screen/artist_detail/screen.dart';
import 'package:room_movie/screen/dashboard/binding.dart';
import 'package:room_movie/screen/dashboard/screen.dart';
import 'package:room_movie/screen/discover/bloc.dart';
import 'package:room_movie/screen/discover/screen.dart';
import 'package:room_movie/screen/gallery/bloc.dart';
import 'package:room_movie/screen/gallery/preview/bloc.dart';
import 'package:room_movie/screen/gallery/preview/screen.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/screen/movie_detail/screen.dart';
import 'package:room_movie/screen/movie_list/bloc.dart';
import 'package:room_movie/screen/movie_list/screen.dart';
import 'package:room_movie/screen/search/bloc.dart';
import 'package:room_movie/screen/search/screen.dart';
import 'package:room_movie/screen/serial_tv_detail/bloc.dart';
import 'package:room_movie/screen/serial_tv_detail/screen.dart';
import 'package:room_movie/screen/serial_tv_list/screen.dart';

import '../screen/gallery/screen.dart';
import '../screen/serial_tv_list/bloc.dart';
import '../screen/splash_screen/screen.dart';

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
    GetPage(
        name: Pages.serialTvDetailScreen,
        page: () => const SerialTvDetailScreen(),
        binding: BindingsBuilder(() {
          Get.put(SerialTvDetailBloc());
        })),
    GetPage(
        name: Pages.galleryScreen,
        page: () => const GalleryScreen(),
        binding: BindingsBuilder(() {
          Get.put(GalleryBloc());
        })),
    GetPage(
        name: Pages.previewScreen,
        page: () => const PreviewScreen(),
        binding: BindingsBuilder(() {
          Get.put(PreviewBloc());
        })),
    GetPage(
        name: Pages.searchScreen,
        page: () => const SearchScreen(),
        binding: BindingsBuilder(() {
          Get.put(SearchBloc());
        })),
    GetPage(
        name: Pages.artistDetailScreen,
        page: () => const ArtistDetailScreen(),
        binding: BindingsBuilder(() {
          Get.put(ArtistDetailBloc());
        })),
    GetPage(
        name: Pages.discoverScreen,
        page: () => const DiscoverScreen(),
        binding: BindingsBuilder(() {
          Get.put(DiscoverBloc());
        })),
  ];
}

class Pages {
  static const splashScreen = "/splash_screen";
  static const dashboardScreen = "/dashboard_screen";
  static const movieListScreen = "/movie_list_screen";
  static const movieDetailScreen = "/movie_detail_Screen";
  static const serialTvListScreen = "/serial_tv_list_screen";
  static const serialTvDetailScreen = "/serial_tv_detail_screen";
  static const galleryScreen = "/gallery_screen";
  static const previewScreen = "/preview_screen";
  static const searchScreen = "/search_screen";
  static const artistDetailScreen = "/artist_detail_screen";
  static const discoverScreen = "/discover_screen";
}
