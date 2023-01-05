// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/widget/animated_stagger_builder.dart';

import '../../models/movie/detail/images_item.dart';
import '../../router/app_route.dart';
import '../../util/constant.dart';
import '../widget/gesture_scaffold.dart';
import '../widget/global_header.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen(
      {Key? key, required this.list, required this.title, required this.ratio})
      : super(key: key);
  final List<ImagesItem> list;
  final String title;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
        appBar: GlobalHeader(
          title: title,
        ),
        body: AnimatedStaggerBuilder(
          crossAxisCount: ratio == 2 ? 2 : 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          itemCount: list.length,
          itemBuilder: (context, index) {
            var item = list[index];
            return InkWell(
              onTap: () {
                Get.toNamed(Pages.previewScreen, arguments: {
                  "currentIndex": index,
                  "listImage": list,
                  "isDetail": false
                });
              },
              child: Hero(
                tag: "item_$index",
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "${Constant.baseImage}${item.filePath}",
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (index) {
            var item = list[index];
            return StaggeredTile.count(1, item.aspectRatio! * ratio);
          },
        ));
  }
}
