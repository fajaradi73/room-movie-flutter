// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:room_movie/screen/gallery/preview/bloc.dart';

import '../../../util/constant.dart';
import '../../widget/gesture_scaffold.dart';
import '../../widget/global_header.dart';

class PreviewScreen extends GetView<PreviewBloc> {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
        appBar: const GlobalHeader(
          title: "",
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PhotoViewGallery.builder(
                itemCount: !controller.isDetail
                    ? controller.list.length
                    : controller.list.length > 5
                        ? 5
                        : controller.list.length,
                scrollPhysics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                pageController: controller.pageController,
                builder: (context, index) {
                  var item = controller.list[index];
                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        NetworkImage("${Constant.baseImage}${item.filePath}"),
                    initialScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 4.1,
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: controller.isDetail
                            ? "detail_$index"
                            : "item_$index"),
                  );
                })
          ],
        ));
  }
}
