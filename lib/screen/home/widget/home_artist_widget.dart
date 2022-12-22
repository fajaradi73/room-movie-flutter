import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/home/widget/item/home_artist_item.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

import '../../../models/artist/artist_results.dart';
import '../../widget/animated_list_builder.dart';
import '../home_bloc.dart';

// ignore: must_be_immutable
class HomeArtistWidget extends GetView<HomeBloc> {
  late List<ArtistResults> list;

  HomeArtistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      list = controller.listArtist;
      return Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text("Popular Artist",
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
            constraints: const BoxConstraints(minHeight: 200, maxHeight: 250),
            child: AnimatedListBuilder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: list.length > 5 ? 5 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  ArtistResults data = list[index];
                  return ShimmerSwitch(
                      stream: controller.isLoading.stream,
                      child: HomeArtistItem(item: data));
                }),
          )
        ],
      );
    });
  }
}
