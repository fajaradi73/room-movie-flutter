import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/movie_type.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';
import 'package:room_movie/screen/movie_list/bloc.dart';
import 'package:room_movie/screen/shimmer/shimmer_movie_list.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';
import 'package:room_movie/screen/widget/global_header.dart';

import '../widget/LoadingScreen.dart';
import '../widget/animated_stagger_builder.dart';
import '../widget/lazy_load.dart';
import '../widget/shimmer_loading.dart';
import 'list_item.dart';

/// Created by Fajar Adi Prasetyo on 20/12/2022.

class MovieListScreen extends GetView<MovieListBloc> {
  MovieListScreen({super.key});

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
      appBar: GlobalHeader(
        title: dashboardBloc.movieType.value.label,
      ),
      body: EasyRefresh(
        onRefresh: () async {
          controller.list.clear();
          await controller.getMovie(1);
        },
        child: Obx(() {
          if (controller.list.isNotEmpty) {
            return LazyLoad(
                isLoading: controller.pageLoad.value,
                child: AnimatedStaggerBuilder(
                    controller: controller.scrollController,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: (controller.pageLoad.value).either(
                        trueV: controller.list.length + 1,
                        falseV: controller.list.length),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SwitcherBuilder(builder: () {
                        if (controller.pageLoad.value &&
                            index >= controller.list.length) {
                          return const Center(child: LoadingScreen());
                        } else {
                          var data = controller.list[index];
                          return MovieListItem(
                            data: data,
                          );
                        }
                      });
                    },
                    staggeredTileBuilder: (index) {
                      if (controller.pageLoad.value &&
                          index >= controller.list.length) {
                        return StaggeredTile.count(
                            2, Get.width / (Get.height / 1));
                      } else {
                        return const StaggeredTile.fit(1);
                      }
                    }),
                onEndOfPage: () async {
                  await controller.getMovie(controller.currentPage.value);
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
                            child: const ShimmerMovieList());
                      });
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(
                      1, Get.width / (Get.height / 0.47.height()));
                });
          }
        }),
      ),
      floatingActionButton: Obx(() {
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
}
