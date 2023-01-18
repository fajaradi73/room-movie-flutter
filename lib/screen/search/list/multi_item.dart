// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 16/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/search/search_item.dart';
import 'package:room_movie/screen/search/bloc.dart';
import 'package:room_movie/screen/widget/image_view.dart';
import 'package:sizer/sizer.dart';

import '../../../util/util.dart';

class SearchMultiItem extends GetView<SearchBloc> {
  const SearchMultiItem({Key? key, required this.data}) : super(key: key);

  final SearchItem data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(controller.getPageName(data.mediaType),
            arguments: {"idResults": data.id});
      },
      child: (data.mediaType.equal("person"))
          ? Column(
              children: [
                SizedBox(
                  height: 25.0.height(),
                  width: Get.width,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ImageView(
                      url: data.profilePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    "${data.name}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: Get.width,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  child: FutureBuilder(
                      future: getKnowFor(data.knownFor),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data?.isNotEmpty == true) {
                          return Text(
                              "${data.knownForDepartment} • ${snapshot.data}",
                              style: const TextStyle(
                                  fontSize: 13,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1);
                        } else {
                          return const Text("");
                        }
                      }),
                )
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30.0.height(),
                  width: Get.width,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ImageView(
                          url: data.posterPath,
                          fit: BoxFit.cover,
                        ),
                        Container(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.5),
                                    child: Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Text(
                                    data.voteAverage != null
                                        ? prettify(
                                            double.parse("${data.voteAverage}"))
                                        : "",
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: SizerUtil.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    "${data.title ?? data.name}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: SizerUtil.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  child: FutureBuilder(
                      future: getGenre(data.genreIds,
                          (data.mediaType.equal("movie")) ? true : false),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.data?.isNotEmpty == true) {
                          return Text("${snapshot.data}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1);
                        } else {
                          return const Text("-");
                        }
                      }),
                ),
                Container(
                  width: SizerUtil.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  child: Text(
                      (data.releaseDate ?? data.firstAirDate).dateFormat(
                              currentFormat: "yyyy-MM-dd",
                              desiredFormat: "dd MMMM yyyy") ??
                          "Unknown",
                      style: const TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis),
                      maxLines: 1),
                )
              ],
            ),
    );
  }
}
