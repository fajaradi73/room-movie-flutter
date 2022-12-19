/*
 * room_movie
 *     ApiService.dart
 *     Created by Fajar Adi Prasetyo on 30/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'dart:async';

import 'package:room_movie/models/artist/artist_response.dart';
import 'package:room_movie/service/api_uri.dart';
import 'package:room_movie/service/dio_util.dart';

import '../models/movie/Movie.dart';

class ApiService {
  final dio = DioUtil();

  Future<Movie?> getMoviePopular(int page) async {
    var data = await dio.get(uri: ApiUri.popularMovie(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getMovieNow(int page) async {
    var data = await dio.get(uri: ApiUri.nowPLayingMovie(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getMovieUpcoming(int page) async {
    var data = await dio.get(uri: ApiUri.upComingMovie(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getMovieTopRated(int page) async {
    var data = await dio.get(uri: ApiUri.topRatedMovie(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getMovieTrending(int page) async {
    var data = await dio.get(uri: ApiUri.trendingMovie(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getTVPopular(int page) async {
    var data = await dio.get(uri: ApiUri.popularSerialTv(page));
    return Movie.fromJson(data);
  }

  Future<ArtistResponse?> getArtistPopular(int page) async {
    var data = await dio.get(uri: ApiUri.popularArtist(page));
    return ArtistResponse.fromJson(data);
  }
}