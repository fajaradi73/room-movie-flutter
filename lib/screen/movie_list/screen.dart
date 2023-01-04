import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/movie_type.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';
import 'package:room_movie/screen/movie_list/bloc.dart';
import 'package:room_movie/screen/movie_list/list_item.dart';
import 'package:room_movie/screen/widget/animated_grid_builder.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';
import 'package:room_movie/screen/widget/global_header.dart';

import '../widget/LoadingScreen.dart';
import '../widget/lazy_load.dart';
import '../widget/shimmer_loading.dart';

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
          await controller.getMovie(1);
        },
        child: Obx(() {
          return LazyLoad(
              isLoading: controller.pageLoad.value,
              child: AnimatedGridBuilder(
                  controller: controller.scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: Get.width / (Get.height / 1.16)),
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
                        return ShimmerSwitch(
                            stream: controller.isLoading.stream,
                            child: MovieListItem(
                              data: data,
                            ));
                      }
                    });
                  }),
              onEndOfPage: () async {
                await controller.getMovie(controller.currentPage.value);
              });
        }),
      ),
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
}
