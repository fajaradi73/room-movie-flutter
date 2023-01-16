// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 16/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../../models/artist/artist_results.dart';
import '../../../router/app_route.dart';
import '../../../util/util.dart';
import '../../widget/image_view.dart';

class SearchArtistItem extends StatelessWidget {
  const SearchArtistItem({Key? key, required this.data}) : super(key: key);
  final ArtistResults data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Pages.artistDetailScreen,
            arguments: {"idResults": data.id});
      },
      child: Column(
        children: [
          SizedBox(
            height: 25.0.height(),
            width: Get.width,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ImageView(
                url: data.profilePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            child: Text(
              "${data.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            child: FutureBuilder(
                future: getKnowFor(data.knownFor),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text("${data.knownForDepartment} • ${snapshot.data}",
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
    );
  }
}
