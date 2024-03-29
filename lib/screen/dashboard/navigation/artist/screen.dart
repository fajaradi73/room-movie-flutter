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
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/dashboard/navigation/artist/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/artist/results_item.dart';
import 'package:room_movie/screen/shimmer/shimmer_artist_list.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';
import 'package:room_movie/screen/widget/animated_stagger_builder.dart';
import 'package:room_movie/screen/widget/lazy_load.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

class ArtistScreen extends GetView<ArtistBloc> {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(onRefresh: () async {
      controller.listArtist.clear();
      controller.getArtist(1);
    }, child: Obx(() {
      if (controller.listArtist.isNotEmpty) {
        return LazyLoad(
            isLoading: controller.pageLoad.value,
            child: AnimatedStaggerBuilder(
                controller: controller.scrollController,
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
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
                },
                staggeredTileBuilder: (index) {
                  if (controller.pageLoad.value &&
                      index >= controller.listArtist.length) {
                    return StaggeredTile.count(2, Get.width / (Get.height / 1));
                  } else {
                    return const StaggeredTile.fit(1);
                  }
                }),
            onEndOfPage: () async {
              await controller.getArtist(controller.currentPage.value);
            });
      } else {
        return AnimatedStaggerBuilder(
            controller: controller.scrollController,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SwitcherBuilder(
                  fadeDuration: const Duration(milliseconds: 1000),
                  sizeDuration: const Duration(milliseconds: 1000),
                  builder: () {
                    return ShimmerSwitch(
                        stream: controller.isLoading.stream,
                        child: const ShimmerArtistList());
                  });
            },
            staggeredTileBuilder: (index) {
              return const StaggeredTile.fit(1);
            });
      }
    }));
  }
}
