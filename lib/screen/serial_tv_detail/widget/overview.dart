// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 04/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/gen_theme/fonts.gen.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/router/app_route.dart';
import 'package:room_movie/util/util.dart';

import '../bloc.dart';

class SerialTvDetailWidgetOverview extends GetView<SerialTvDetailBloc> {
  const SerialTvDetailWidgetOverview({Key? key, required this.data})
      : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 18,
                        color: (Get.isDarkMode) ? Colors.white : Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: FontFamily.palatinoLinotype),
                    children: [
                  ...data.genres!
                      .asMap()
                      .map((index, e) {
                        var name = (index != (data.genres!.length - 1))
                            ? "${e.name}, "
                            : "${e.name}";
                        return MapEntry(
                            index,
                            TextSpan(
                                text: name,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Pages.discoverScreen,
                                        arguments: {
                                          "title": e.name,
                                          "isMovie": false,
                                          "genre": e.id.toString()
                                        });
                                  }));
                      })
                      .values
                      .toList()
                ])),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                ),
              ),
              Text(
                "${prettify(double.parse("${data.voteAverage}"))} \u2022 "
                "${data.firstAirDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM yyyy")}"
                " \u2022 ${controller.getEpisodeRuntime(data.episodeRunTime)} m",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Kilasan Singkat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${data.overview}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
