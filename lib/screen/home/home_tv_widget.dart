// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/home/home_bloc.dart';

import '../../models/movie/Results.dart';
import '../../util/Constant.dart';

class HomeTvWidget extends StatelessWidget {
  late List<Results> list;

  HomeTvWidget({Key? key}) : super(key: key);

  final homeLogic = Get.find<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      list = homeLogic.listTv;
      return Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Popular Serial Tv",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: const Icon(Icons.keyboard_arrow_right))
                ],
              ),
            ),
          ),
          Container(
              constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: list.length > 5 ? 5 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  Results data = list[index];
                  return Container(
                    width: 275,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          width: 275,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: Constant.baseImage +
                                  data.backdropPath.toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
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
                                  height: 70,
                                  width: 70,
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: Constant.baseImage +
                                          data.posterPath.toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                            data.title ?? data.name ?? "",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 1,
                                          )),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          margin: const EdgeInsets.all(3),
                                          child: FutureBuilder(
                                              future: homeLogic.getGenre(
                                                  data.genreIds, false),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  return Text(
                                                      snapshot.data.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
                  );
                },
              )),
        ],
      );
    });
  }
}
