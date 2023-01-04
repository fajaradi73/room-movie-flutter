// ignore_for_file: file_names
/*
 * 
 *     movie_list_item
 *     Created by Fajar Adi Prasetyo on 20/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:sizer/sizer.dart';

import '../../gen_theme/assets.gen.dart';
import '../../router/app_route.dart';
import '../../util/constant.dart';
import '../../util/util.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.data});

  final Results data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.movieDetailScreen, arguments: {"idMovie": data.id});
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30.0.height(),
            width: SizerUtil.width,
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
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.topRight,
                  child: Container(
                      width: 45,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15.0))),
                      child: Center(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.5),
                              child: Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                            ),
                            Text(
                              "${data.voteAverage}",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      )),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Assets.images.noImage.image(),
              ),
            ),
          ),
          Container(
            width: SizerUtil.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${data.title}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
          Container(
            width: SizerUtil.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: FutureBuilder(
                future: getGenre(data.genreIds, true),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text("${snapshot.data}",
                        style: const TextStyle(
                            fontSize: 14, overflow: TextOverflow.ellipsis),
                        maxLines: 1);
                  } else {
                    return const Text("");
                  }
                }),
          ),
          Container(
            width: SizerUtil.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
                "${data.releaseDate.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM yyyy")}",
                style: const TextStyle(
                    fontSize: 14, overflow: TextOverflow.ellipsis),
                maxLines: 1),
          )
        ],
      ),
    );
  }
}
