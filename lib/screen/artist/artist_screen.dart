/*
 * room_movie
 *     artist_screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/artist/artist_bloc.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';
import 'package:room_movie/screen/widget/lazy_load.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

import '../../util/Constant.dart';
import '../../util/Util.dart';

class ArtistScreen extends GetView<ArtistBloc> {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(onRefresh: () async {
      await controller.getArtist(1);
    }, child: Obx(() {
      return LazyLoad(
          isLoading: controller.pageLoad.value,
          child: GridView.builder(
              controller: controller.scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.10.height()),
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
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.0.height(),
                                width: SizerUtil.width,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${Constant.baseImage}${data.profilePath}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Container(
                                width: SizerUtil.width,
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "${data.name}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                width: SizerUtil.width,
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(2),
                                child: FutureBuilder(
                                    future: getKnowFor(data.knownFor),
                                    builder: (_, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(
                                            "${data.knownForDepartment} • ${snapshot.data}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 1);
                                      } else {
                                        return const Text("");
                                      }
                                    }),
                              )
                            ],
                          ),
                        ));
                  }
                });
              }),
          onEndOfPage: () async {
            await controller.getArtist(controller.currentPage.value);
          });
    }));
  }
}
