import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/router/app_route.dart';
import 'package:room_movie/screen/dashboard/navigation/home/bloc.dart';
import 'package:room_movie/screen/widget/image_view.dart';
import 'package:room_movie/util/util.dart';

class HomeArtistItem extends GetView<HomeBloc> {
  final ArtistResults item;

  const HomeArtistItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.artistDetailScreen,
            arguments: {"idResults": item.id});
      },
      child: Container(
        width: 45.0.width(),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 21.0.height(),
              width: 75.0.width(),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ImageView(
                  url: item.profilePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: Get.width,
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
              width: Get.width,
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
