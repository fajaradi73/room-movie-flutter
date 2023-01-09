// ignore_for_file: file_names
/*
 * 
 *     widget_recomendation
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/screen/widget/animated_list_builder.dart';

import '../../../models/movie/Results.dart';
import '../../../util/util.dart';
import '../../widget/image_view.dart';

class MovieDetailWidgetRecommendation extends GetView<MovieDetailBloc> {
  const MovieDetailWidgetRecommendation({Key? key, required this.list})
      : super(key: key);

  final List<Results> list;

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
              "Disarankan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 31.0.height()),
            child: AnimatedListBuilder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: list.length > 10 ? 10 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = list[index];
                  return InkWell(
                    onTap: () async {
                      await controller.getMovieDetail(item.id!);
                    },
                    child: Container(
                      width: 75.0.width(),
                      margin: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 25.0.height(),
                            width: 75.0.width(),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ImageView(
                                    url: item.posterPath,
                                    fit: BoxFit.cover,
                                  ),
                                  widgetVote(context, item)
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: Get.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Text(
                                "${item.title}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }

  widgetVote(context, item) {
    return Container(
        width: 45,
        height: 25,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(10.0))),
        child: Center(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.amber,
                ),
              ),
              Text(
                prettify(double.parse("${item.voteAverage}")),
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
