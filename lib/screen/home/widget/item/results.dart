import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/screen/home/bloc.dart';

import '../../../../gen_theme/assets.gen.dart';
import '../../../../router/app_route.dart';
import '../../../../util/constant.dart';
import '../../../../util/util.dart';

class HomeResultsItem extends GetView<HomeBloc> {
  final Results data;
  final bool isMovie;

  const HomeResultsItem({super.key, required this.data, required this.isMovie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
            isMovie ? Pages.movieDetailScreen : Pages.serialTvDetailScreen,
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
                                data.title ?? data.name ?? "",
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
                                  future: getGenre(data.genreIds, isMovie),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Text(snapshot.data.toString(),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 1);
                                    } else {
                                      return const Text("");
                                    }
                                  })),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(3),
                              child: Text(
                                  "${data.voteAverage} ★ ${data.releaseDate != null && data.releaseDate?.isNotEmpty == true ? "${data.releaseDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM yyyy")}" : "${data.firstAirDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM yyyy")}"}",
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
