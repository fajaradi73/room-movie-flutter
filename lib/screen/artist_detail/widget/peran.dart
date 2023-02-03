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
import '../../widget/image_view.dart';

class ArtistDetailWidgetPeran extends GetView<ArtistDetailBloc> {
  const ArtistDetailWidgetPeran({Key? key, this.list}) : super(key: key);
  final List<CreditsItem>? list;
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
                "Peran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            (list != null && list?.isNotEmpty == true)
                ? Container(
                    constraints: BoxConstraints(
                        minHeight: 200, maxHeight: 32.0.height()),
                    child: AnimatedListBuilder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: list?.length.isGreaterThan(10) == true
                            ? 10
                            : list?.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = list![index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                  (item.mediaType == "movie")
                                      ? Pages.movieDetailScreen
                                      : Pages.serialTvDetailScreen,
                                  arguments: {"idResults": item.id});
                            },
                            child: Container(
                              width: 45.0.width(),
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 26.0.height(),
                                    width: 75.0.width(),
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: ImageView(
                                        url: item.posterPath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(2),
                                    child: Text("${item.title ?? item.name}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 1),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))
                : const Center(
                    child: Text("No Data"),
                  ),
          ],
        ));
  }
}
