// ignore_for_file: file_names
/*
 * 
 *     artist_results_item
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';

import '../../util/constant.dart';
import '../../util/util.dart';

class ArtistResultsItem extends StatelessWidget {
  const ArtistResultsItem({Key? key, required this.data}) : super(key: key);
  final ArtistResults data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              child: CachedNetworkImage(
                imageUrl: "${Constant.baseImage}${data.profilePath}",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
