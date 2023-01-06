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
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/gallery/bloc.dart';
import 'package:room_movie/screen/widget/animated_stagger_builder.dart';

import '../../router/app_route.dart';
import '../../util/constant.dart';
import '../widget/animated_list_builder.dart';
import '../widget/gesture_scaffold.dart';
import '../widget/global_header.dart';

class GalleryScreen extends GetView<GalleryBloc> {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
      appBar: GlobalHeader(
        title: controller.title,
      ),
      body: controller.listImages.isNotEmpty ? widgetImages() : widgetVideo(),
      floatingAction: Obx(() {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          //show/hide animation
          opacity: controller.showButton.value ? 1.0 : 0.0,
          //set obacity to 1 on visible, or hide
          child: FloatingActionButton(
            onPressed: () {
              controller.scrollController.animateTo(
                  //go to top of scroll
                  0, //scroll offset to go
                  duration: const Duration(milliseconds: 500),
                  //duration of scroll
                  curve: Curves.fastOutSlowIn //scroll type
                  );
            },
            child: const Icon(Icons.arrow_upward),
          ),
        );
      }),
    );
  }

  widgetImages() {
    return AnimatedStaggerBuilder(
      controller: controller.scrollController,
      crossAxisCount: controller.ratio == 2 ? 2 : 1,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      itemCount: controller.listImages.length,
      itemBuilder: (context, index) {
        var item = controller.listImages[index];
        return InkWell(
          onTap: () {
            Get.toNamed(Pages.previewScreen, arguments: {
              "currentIndex": index,
              "listImage": controller.listImages,
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (index) {
        var item = controller.listImages[index];
        return StaggeredTile.count(1, item.aspectRatio! * controller.ratio);
      },
    );
  }

  widgetVideo() {
    return AnimatedListBuilder(
        controller: controller.scrollController,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.listVideo.length,
        itemBuilder: (BuildContext context, int index) {
          var item = controller.listVideo[index];
          return InkWell(
            onTap: () {},
            child: Container(
              height: 30.0.height(),
              width: Get.width,
              margin: const EdgeInsets.all(3),
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
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Colors.black54,
                          height: 50,
                          width: Get.width,
                          padding: const EdgeInsets.all(10),
                          child: Text("${item.name}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1),
                        ));
                  },
                ),
              ),
            ),
          );
        });
  }
}
