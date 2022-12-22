/*
 * room_movie
 *     movie_widget_list.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/util/Util.dart';

import '../../util/Constant.dart';
import '../widget/animated_list_builder.dart';

// ignore: must_be_immutable
class SerialTvWidgetList extends StatelessWidget {
  const SerialTvWidgetList(this.list, {Key? key}) : super(key: key);

  final List<Results> list;

  @override
  Widget build(BuildContext context) {
    return AnimatedListBuilder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: list.length > 5 ? 5 : list.length,
      itemBuilder: (BuildContext context, int index) {
        Results data = list[index];
        return InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  height: 18.5.height(),
                  width: 75.0.width(),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "${Constant.baseImage}${data.backdropPath}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                          width: 20.0.width(),
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${Constant.baseImage}${data.posterPath}",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 175),
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
                                            ConnectionState.done) {
                                          return Text("${snapshot.data}",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              maxLines: 1);
                                        } else {
                                          return const Text("");
                                        }
                                      })),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.all(3),
                                  child: Text("${data.voteAverage} ★",
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
      },
    );
  }
}
