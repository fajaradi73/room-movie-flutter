// ignore_for_file: file_names
/*
 * 
 *     widget_actor
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';

import '../../models/artist/artist_results.dart';

class MovieDetailWidgetActor extends GetView<MovieDetailBloc> {
  const MovieDetailWidgetActor({Key? key, required this.data})
      : super(key: key);
  final ArtistResults data;

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
              "Aktor Utama",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 30.0.height()),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 45.0.width(),
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 21.0.height(),
                            width: 75.0.width(),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://images4.alphacoders.com/113/1130246.jpg",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            child: const Text(
                              "dada",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            child: const Text("asa",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Kru & Aktor Lainnya",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorName.blue500),
            ),
          ),
        ]));
  }
}
