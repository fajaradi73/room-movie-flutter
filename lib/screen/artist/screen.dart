/*
 * room_movie
 *     screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/artist/bloc.dart';
import 'package:room_movie/screen/artist/results_item.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';
import 'package:room_movie/screen/widget/animated_grid_builder.dart';
import 'package:room_movie/screen/widget/lazy_load.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

class ArtistScreen extends GetView<ArtistBloc> {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(onRefresh: () async {
      await controller.getArtist(1);
    }, child: Obx(() {
      return LazyLoad(
          isLoading: controller.pageLoad.value,
          child: AnimatedGridBuilder(
              controller: controller.scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: Get.width / (Get.height / 1.5)),
              itemCount: (controller.pageLoad.value).either(
                  trueV: controller.listArtist.length + 1,
                  falseV: controller.listArtist.length),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SwitcherBuilder(builder: () {
                  if (controller.pageLoad.value &&
                      index >= controller.listArtist.length) {
                    return const Center(child: LoadingScreen());
                  } else {
                    var data = controller.listArtist[index];
                    return ShimmerSwitch(
                        stream: controller.isLoading.stream,
                        child: ArtistResultsItem(data: data));
                  }
                });
              }),
          onEndOfPage: () async {
            await controller.getArtist(controller.currentPage.value);
          });
    }));
  }
}
