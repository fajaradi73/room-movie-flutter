// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/detail/images.dart';
import 'package:room_movie/models/movie/detail/videos.dart';
import 'package:room_movie/screen/gallery/screen.dart';
import 'package:room_movie/screen/widget/animated_list_builder.dart';

import '../../../router/app_route.dart';
import '../../../util/constant.dart';

class SerialTvDetailWidgetMedia extends StatelessWidget {
  const SerialTvDetailWidgetMedia(
      {Key? key, required this.videos, required this.images})
      : super(key: key);
  final Videos videos;
  final Images images;

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
              "Media",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          /// Videos
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: const Text(
                  "Video",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: Text(
                  "(${videos.results?.length ?? 0})",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: videos.results != null &&
                    videos.results?.isNotEmpty == true,
                child: Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  child: const Text(
                    "Lihat Semua Video",
                    style: TextStyle(fontSize: 16, color: ColorName.blue500),
                  ),
                ),
              ),
            ],
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 29.0.height()),
            child: (videos.results != null &&
                    videos.results?.isNotEmpty == true)
                ? AnimatedListBuilder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: videos.results?.length.isGreaterThan(5) == true
                        ? 5
                        : videos.results?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = videos.results![index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 25.0.height(),
                                width: 65.0.width(),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${Constant.baseThumbnail}${item.key}${Constant.sdQuality}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Container(
                                width: 65.0.width(),
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(2),
                                child: Text("${item.name}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: Text("No data"),
                  ),
          ),

          ///
          /// Gambar Latar
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: const Text(
                  "Gambar Latar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: Text(
                  "(${images.backdrops?.length ?? 0})",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: images.backdrops != null &&
                    images.backdrops?.isNotEmpty == true,
                child: InkWell(
                  onTap: () {
                    Get.to(() => GalleryScreen(
                          list: images.backdrops!,
                          title: "Gambar Latar",
                          ratio: 0.3,
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    child: const Text(
                      "Lihat Semua Gambar Latar",
                      style: TextStyle(fontSize: 16, color: ColorName.blue500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 27.0.height()),
            child: (images.backdrops != null &&
                    images.backdrops?.isNotEmpty == true)
                ? AnimatedListBuilder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: images.backdrops?.length.isGreaterThan(5) == true
                        ? 5
                        : images.backdrops?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = images.backdrops![index];
                      var list = images.backdrops;
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Pages.previewScreen, arguments: {
                            "currentIndex": index,
                            "listImage": list,
                            "isDetail": true
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          height: 25.0.height(),
                          width: 65.0.width(),
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: "${Constant.baseImage}${item.filePath}",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: Text("No data"),
                  ),
          ),

          ///
          /// Gambar Poster
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: const Text(
                  "Poster",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: Text(
                  "(${images.posters?.length ?? 0})",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: images.posters != null &&
                    images.posters?.isNotEmpty == true,
                child: InkWell(
                    onTap: () {
                      Get.to(() => GalleryScreen(
                            list: images.posters!,
                            title: "Poster",
                            ratio: 2,
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(2),
                      child: const Text(
                        "Lihat Semua Poster",
                        style:
                            TextStyle(fontSize: 16, color: ColorName.blue500),
                      ),
                    )),
              ),
            ],
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 27.0.height()),
            child: (images.posters != null &&
                    images.posters?.isNotEmpty == true)
                ? AnimatedListBuilder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: images.posters?.length.isGreaterThan(5) == true
                        ? 5
                        : images.posters?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = images.posters![index];
                      var list = images.posters;
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Pages.previewScreen, arguments: {
                            "currentIndex": index,
                            "listImage": list,
                            "isDetail": true
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          height: 25.0.height(),
                          width: 65.0.width(),
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: "${Constant.baseImage}${item.filePath}",
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: Text("No data"),
                  ),
          )

          ///
        ]));
  }
}
