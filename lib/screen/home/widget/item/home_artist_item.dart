import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/screen/home/home_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../util/Constant.dart';
import '../../../../util/Util.dart';

class HomeArtistItem extends GetView<HomeBloc> {
  final ArtistResults item;

  const HomeArtistItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
                  imageUrl: Constant.baseImage + item.profilePath.toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Container(
              width: SizerUtil.width,
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              child: Center(
                child: Text(
                  "${item.name}",
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
                  future: getKnowFor(item.knownFor),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                          "${item.knownForDepartment} • ${snapshot.data}",
                          style: const TextStyle(
                              fontSize: 13, overflow: TextOverflow.ellipsis),
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
  }
}
