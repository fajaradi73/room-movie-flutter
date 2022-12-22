import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/screen/home/home_bloc.dart';

import '../../../../router/app_route.dart';
import '../../../../util/Constant.dart';
import '../../../../util/Util.dart';

class HomeResultsItem extends GetView<HomeBloc> {
  final Results data;
  final bool isMovie;
  const HomeResultsItem({super.key, required this.data, required this.isMovie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.movieDetailScreen, arguments: {"idMovie": data.id});
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  imageUrl: Constant.baseImage + data.backdropPath.toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      width: 22.0.width(),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              Constant.baseImage + data.posterPath.toString(),
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      constraints:
                          const BoxConstraints(minWidth: 100, maxWidth: 175),
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
  }
}
