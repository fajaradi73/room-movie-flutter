/*
 * room_movie
 *     WidgetListView.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/util/Util.dart';

import '../../models/genre/Genre.dart';
import '../../util/Constant.dart';

class WidgetListView extends StatelessWidget {
  final List<Results> list;
  final bool isMovie;

  const WidgetListView(this.list, this.isMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: list.length > 5 ? 5 : list.length,
      itemBuilder: (BuildContext context, int index) {
        Results data = list[index];
        return Container(
          width: 275,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 160,
                width: 275,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: Constant.baseImage + data.backdropPath.toString(),
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                Constant.baseImage + data.posterPath.toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        constraints:
                            const BoxConstraints(minWidth: 100, maxWidth: 175),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(3),
                                child: Text(
                                  data.title ?? data.name ?? "",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 1,
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(3),
                                child: FutureBuilder(
                                    future: _getGenre(data.genreIds),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(snapshot.data.toString(),
                                            style: const TextStyle(
                                                fontSize: 13,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 1);
                                      } else {
                                        return const Text("");
                                      }
                                    })),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(3),
                                child: Text("${data.voteAverage} ★",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _getGenreName(int id) async {
    var genre = "";
    List<Genre> listGenre = [];
    var parse = await parseListJsonFromAssets("assets/json/genre_tv.json");
    if (isMovie) {
      parse = await parseListJsonFromAssets("assets/json/genre_movie.json");
    }
    listGenre = List<Genre>.from(parse.map((e) => Genre.fromJson(e)));
    for (var data in listGenre) {
      if (data.id == id) {
        genre = data.name ?? "";
      }
    }
    return genre;
  }

  _getGenre(List<int>? listId) async {
    String nameGenre = "";
    if (listId != null) {
      for (int i = 0; i < listId.length; i++) {
        String name = await _getGenreName(listId[i]);
        if (name.isNotEmpty) {
          if (i == (listId.length - 1)) {
            nameGenre = nameGenre + name;
          } else {
            nameGenre = "$nameGenre$name • ";
          }
        }
      }
    }
    return nameGenre;
  }
}
