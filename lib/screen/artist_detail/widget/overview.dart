// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 10/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/screen/artist_detail/bloc.dart';
import 'package:room_movie/screen/widget/DescriptionTextWidget.dart';

class ArtistDetailWidgetOverview extends GetView<ArtistDetailBloc> {
  const ArtistDetailWidgetOverview({Key? key, required this.data})
      : super(key: key);
  final ArtistResults data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Biography",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            // child: ExpandableText(
            //   "${data.biography}",
            //   trimLines: 7,
            //   style: const TextStyle(fontSize: 14),
            // ),
            child: DescriptionTextWidget(
              "${data.biography}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
