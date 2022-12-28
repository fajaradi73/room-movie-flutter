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
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/screen/movie_detail/widget/widget_actor.dart';
import 'package:room_movie/screen/movie_detail/widget/widget_appbar.dart';
import 'package:room_movie/screen/movie_detail/widget/widget_info.dart';
import 'package:room_movie/screen/movie_detail/widget/widget_media.dart';
import 'package:room_movie/screen/movie_detail/widget/widget_overview.dart';
import 'package:room_movie/screen/movie_detail/widget/widget_recommendation.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';

class MovieDetailScreen extends GetView<MovieDetailBloc> {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      var data = controller.data.value;
      return (controller.isLoading.value == true)
          ? const Center(
              child: LoadingScreen(),
            )
          : NestedScrollView(
              controller: controller.scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  MovieDetailWidgetAppbar(
                    data: data,
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
                        data: data,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      MovieDetailWidgetInfo(
                        data: data,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      MovieDetailWidgetActor(data: data.credits),
                      const Padding(padding: EdgeInsets.all(2)),
                      MovieDetailWidgetMedia(
                        videos: data.videos!,
                        images: data.images!,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      MovieDetailWidgetRecommendation(
                        list: data.recommendations!.results!,
                      )
                    ],
                  ),
                ),
              ),
            );
    }));
  }
}
