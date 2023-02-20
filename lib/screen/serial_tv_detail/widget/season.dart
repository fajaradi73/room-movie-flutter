// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/detail/season_item.dart';
import 'package:room_movie/screen/widget/image_view.dart';

import '../../../gen_theme/colors.gen.dart';
import '../../../router/app_route.dart';

class SerialTvDetailWidgetSeason extends StatelessWidget {
  const SerialTvDetailWidgetSeason(
      {Key? key, required this.item, required this.title, required this.list})
      : super(key: key);
  final SeasonItem? item;
  final List<SeasonItem>? list;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Season Terakhir",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0.height(),
                width: Get.width * 0.35,
                child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ImageView(
                      url: item?.posterPath,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                width: Get.width * 0.59,
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Container(
                      width: Get.width * 0.59,
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        "${item?.name}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.59,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        "${item?.airDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "yyyy") ?? "Unknown"} "
                        " | ${item?.episodeCount} Episode",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.59,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        "$title ${item?.name} ditayangkan pada tanggal ${item?.airDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM") ?? "Unknown"}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Pages.seasonScreen,
                  arguments: {"title": title, "season": list});
            },
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Lihat Semua Season",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorName.blue500),
              ),
            ),
          )
        ]));
  }
}
