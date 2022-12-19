import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../models/artist/artist_results.dart';
import '../../util/Constant.dart';
import 'home_bloc.dart';

// ignore: must_be_immutable
class HomeArtistWidget extends StatelessWidget {
  late List<ArtistResults> list;

  HomeArtistWidget({Key? key}) : super(key: key);
  final homeLogic = Get.find<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      list = homeLogic.listArtist;
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
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: list.length > 5 ? 5 : list.length,
                itemBuilder: (BuildContext context, int index) {
                  ArtistResults data = list[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 175,
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 180,
                            width: 275,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: Constant.baseImage +
                                    data.profilePath.toString(),
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
                            child: Center(
                              child: Text(
                                "${data.name}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: SizerUtil.width,
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            child: FutureBuilder(
                                future: homeLogic.getKnowFor(data.knownFor),
                                builder: (_, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Text(
                                        "${data.knownForDepartment} • ${snapshot.data}",
                                        style: const TextStyle(
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 1);
                                  } else {
                                    return const Text("");
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      );
    });
  }
}
