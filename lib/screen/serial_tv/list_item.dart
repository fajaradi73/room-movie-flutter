/*
 * room_movie
 *     list_item.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/util/util.dart';

import '../../gen_theme/assets.gen.dart';
import '../../router/app_route.dart';
import '../../util/constant.dart';

// ignore: must_be_immutable
class SerialTvWidgetListItem extends StatelessWidget {
  const SerialTvWidgetListItem(this.data, {Key? key}) : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.serialTvDetailScreen,
            arguments: {"idResults": data.id});
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.0.height(),
              width: 75.0.width(),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: data.backdropPath != null
                      ? "${Constant.baseImage}${data.backdropPath}"
                      : "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Assets.images.noImage.image(),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(
                      height: 10.0.height(),
                      width: 21.0.width(),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: data.posterPath != null
                              ? "${Constant.baseImage}${data.posterPath}"
                              : "",
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Assets.images.noImage.image(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      constraints: BoxConstraints(
                          minWidth: Get.width * 0.4, maxWidth: Get.width * 0.5),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(3),
                              child: Text(
                                "${data.name}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              )),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(3),
                              child: FutureBuilder(
                                  future: getGenre(data.genreIds, false),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.done &&
                                        snapshot.data != null &&
                                        snapshot.data?.isNotEmpty == true) {
                                      return Text("${snapshot.data}",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 1);
                                    } else {
                                      return const Text("-");
                                    }
                                  })),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(3),
                              child: Text(
                                  "${data.voteAverage} ★ ${data.firstAirDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM yyyy")}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 1)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
