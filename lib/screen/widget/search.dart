// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:room_movie/helper/extensions.dart';

class MySearch extends SearchDelegate {
  List<String> data = [];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unFocus();
      },
      onHorizontalDragStart: (_) {
        context.unFocus();
      },
      onVerticalDragStart: (_) {
        context.unFocus();
      },
      onTapUp: (_) {
        context.unFocus();
      },
      onTapDown: (_) {
        context.unFocus();
      },
      // onTapCancel: context.unFocus,
    );
  }
}
