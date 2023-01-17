// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/enum/movie_type.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/router/app_route.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';
import 'package:room_movie/screen/dashboard/navigation/home/bloc.dart';
import 'package:room_movie/screen/shimmer/shimmer_results.dart';
import 'package:room_movie/screen/widget/animated_list_builder.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

import 'item/results.dart';

class HomeMovieWidget extends GetView<HomeBloc> {
  late List<Results> list;

  HomeMovieWidget({Key? key}) : super(key: key);

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      list = controller.listMovie;
      return Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: InkWell(
              onTap: () {
                dashboardBloc.movieType.value = MovieType.POPULAR;
                Get.toNamed(Pages.movieListScreen);
              },
              child: Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text("Popular Movie",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
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
              constraints: BoxConstraints(
                  minHeight: Get.height * 0.3, maxHeight: Get.height * 0.36),
              child: (list.isNotEmpty)
                  ? AnimatedListBuilder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length > 5 ? 5 : list.length,
                      itemBuilder: (BuildContext context, int index) {
                        Results data = list[index];
                        return HomeResultsItem(
                          data: data,
                          isMovie: true,
                        );
                      },
                    )
                  : SwitcherBuilder(
                      fadeDuration: const Duration(milliseconds: 1000),
                      sizeDuration: const Duration(milliseconds: 1000),
                      builder: () {
                        return AnimatedListBuilder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return ShimmerSwitch(
                              stream: controller.isLoading.stream,
                              child: const ShimmerResults(),
                            );
                          },
                        );
                      },
                    ))
        ],
      );
    });
  }
}
