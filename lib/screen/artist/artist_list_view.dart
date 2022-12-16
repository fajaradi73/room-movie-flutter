import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/artist/artist_results.dart';
import '../../util/Constant.dart';

class ArtistListView extends StatelessWidget {
  final List<ArtistResults> list;

  const ArtistListView(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                        imageUrl:
                            Constant.baseImage + data.profilePath.toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        data.name ?? "",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    child: Text(data.knownForDepartment ?? ""),
                  )
                ],
              ),
            ),
          );
        });
  }
}
