import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/screen/home/bloc.dart';
import 'package:room_movie/screen/widget/image_view.dart';

import '../../../../router/app_route.dart';
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
                child: ImageView(
                  url: data.backdropPath,
                  fit: BoxFit.cover,
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
                        child: ImageView(
                          url: data.posterPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: Get.width * 0.5,
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
