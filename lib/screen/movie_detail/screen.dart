// ignore_for_file: file_names
/*
 * 
 *     screen
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/screen/movie_detail/widget_actor.dart';
import 'package:room_movie/screen/movie_detail/widget_appbar.dart';
import 'package:room_movie/screen/movie_detail/widget_info.dart';
import 'package:room_movie/screen/movie_detail/widget_media.dart';
import 'package:room_movie/screen/movie_detail/widget_overview.dart';
import 'package:room_movie/screen/movie_detail/widget_recommendation.dart';

class MovieDetailScreen extends GetView<MovieDetailBloc> {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailBloc>(
      assignId: true,
      builder: (logic) {
        return Scaffold(
          body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                MovieDetailWidgetAppbar(
                  data: Results(),
                ),
              ];
            },
            body: Container(
              color: Theme.of(context).primaryColor,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    MovieDetailWidgetOverview(
                      data: Results(),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    MovieDetailWidgetInfo(
                      data: Results(),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    MovieDetailWidgetActor(data: ArtistResults()),
                    const Padding(padding: EdgeInsets.all(2)),
                    MovieDetailWidgetMedia(),
                    const Padding(padding: EdgeInsets.all(2)),
                    MovieDetailWidgetRecommendation()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
