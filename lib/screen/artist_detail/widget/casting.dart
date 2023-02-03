// ignore_for_file: file_names, must_be_immutable
/*
 *     Created by Fajar Adi Prasetyo on 10/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/artist_detail/bloc.dart';

import '../../../models/movie/detail/credits_item.dart';
import '../../../router/app_route.dart';
import '../../widget/animated_list_builder.dart';

class ArtistDetailWidgetCasting extends GetView<ArtistDetailBloc> {
  const ArtistDetailWidgetCasting(
      {Key? key, required this.department, required this.data})
      : super(key: key);
  final String? department;
  final List<CreditsItem>? data;

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
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: Text(
                "$department",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: (data != null && data?.isNotEmpty == true)
                  ? AnimatedListBuilder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = data![index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                                (item.mediaType == "movie")
                                    ? Pages.movieDetailScreen
                                    : Pages.serialTvDetailScreen,
                                arguments: {"idResults": item.id},
                                preventDuplicates: false);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                      minHeight: 10.0.height(),
                                      maxHeight: 11.0.height()),
                                  child: Row(children: [
                                    Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          (item.releaseDate ??
                                                      item.firstAirDate)
                                                  .dateFormat(
                                                      currentFormat:
                                                          "yyyy-MM-dd",
                                                      desiredFormat: "yyyy") ??
                                              "-",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const Flexible(
                                      flex: 1,
                                      child: Center(
                                        child: Text("•"),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: Get.width,
                                            margin: const EdgeInsets.all(2),
                                            padding: const EdgeInsets.all(2),
                                            child: Text(
                                                "${item.title ?? item.name}",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 2),
                                          ),
                                          Container(
                                            width: Get.width,
                                            margin: const EdgeInsets.all(2),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                                item.character != null
                                                    ? "as ${item.character}"
                                                    : item.job != null
                                                        ? "... ${item.job}"
                                                        : "",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 2),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : const Center(),
            ),
          ],
        ));
  }
}
