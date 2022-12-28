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
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/service/api_uri.dart';
import 'package:room_movie/util/dio_util.dart';

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

  Future<Results?> getMovieDetail(int id) async {
    var data = await dio.get(
        uri: ApiUri.detailMovie(
            id, "images,videos,keywords,credits,recommendations,external_ids"));
    return Results.fromJson(data);
  }

  Future<Movie?> getTVPopular(int page) async {
    var data = await dio.get(uri: ApiUri.popularSerialTv(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getTVOnTheAir(int page) async {
    var data = await dio.get(uri: ApiUri.onTheAirSerialTv(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getTVTopRate(int page) async {
    var data = await dio.get(uri: ApiUri.topRateSerialTv(page));
    return Movie.fromJson(data);
  }

  Future<Movie?> getTVToday(int page) async {
    var data = await dio.get(uri: ApiUri.airingTodaySerialTv(page));
    return Movie.fromJson(data);
  }

  Future<ArtistResponse?> getArtistPopular(int page) async {
    var data = await dio.get(uri: ApiUri.popularArtist(page));
    return ArtistResponse.fromJson(data);
  }
}
