// ignore_for_file: file_names
/*
 * 
 *     screen
 *     Created by Fajar Adi Prasetyo on 04/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/serial_tv_detail/bloc.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/actor.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/appbar.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/info.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/media.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/overview.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/recommendation.dart';
import 'package:room_movie/screen/serial_tv_detail/widget/season.dart';

import '../widget/LoadingScreen.dart';

class SerialTvDetailScreen extends GetView<SerialTvDetailBloc> {
  const SerialTvDetailScreen({Key? key}) : super(key: key);

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
                  SerialTvDetailWidgetAppbar(
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
                      SerialTvDetailWidgetOverview(
                        data: data,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      SerialTvDetailWidgetInfo(data: data),
                      const Padding(padding: EdgeInsets.all(2)),
                      SerialTvDetailWidgetActor(
                          title: data.name, data: data.credits),
                      const Padding(padding: EdgeInsets.all(2)),
                      SerialTvDetailWidgetSeason(
                        item: data.seasons?.last,
                        list: controller.listSeason(data.seasons),
                        title: data.name,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      SerialTvDetailWidgetMedia(
                          videos: data.videos!, images: data.images!),
                      const Padding(padding: EdgeInsets.all(2)),
                      SerialTvDetailWidgetRecommendation(
                          list: data.recommendations!.results!)
                    ],
                  ),
                ),
              ));
    }));
  }
}
