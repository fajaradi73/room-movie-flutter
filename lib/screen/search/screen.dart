// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/search/bloc.dart';
import 'package:room_movie/screen/search/list/artist_item.dart';
import 'package:room_movie/screen/search/list/multi_item.dart';

import '../../models/enum/search_type.dart';
import '../widget/LoadingScreen.dart';
import '../widget/animated_stagger_builder.dart';
import '../widget/gesture_scaffold.dart';
import '../widget/lazy_load.dart';
import '../widget/shimmer_loading.dart';
import 'list/results_item.dart';

class SearchScreen extends GetView<SearchBloc> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (visible) {
        controller.isKeyboardVisible = visible;
        if (!visible) context.unFocus();
      },
      child: GestureScaffold(
        appBar: searchBar(context),
        body: Obx(() {
          if (controller.list.isNotEmpty) {
            return LazyLoad(
                isLoading: controller.pageLoad.value,
                child: AnimatedStaggerBuilder(
                    controller: controller.scrollController,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: (controller.pageLoad.value).either(
                        trueV: controller.list.length + 1,
                        falseV: controller.list.length),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SwitcherBuilder(builder: () {
                        if (controller.pageLoad.value &&
                            index >= controller.list.length) {
                          return const Center(child: LoadingScreen());
                        } else {
                          var data = controller.list[index];
                          if (controller.searchType == SearchType.MOVIE) {
                            return SearchResultsItem(
                              data: data,
                              isMovie: true,
                            );
                          } else if (controller.searchType == SearchType.TV) {
                            return SearchResultsItem(
                              data: data,
                              isMovie: false,
                            );
                          } else if (controller.searchType ==
                              SearchType.ARTIST) {
                            return SearchArtistItem(
                              data: data,
                            );
                          } else {
                            return SearchMultiItem(
                              data: data,
                            );
                          }
                        }
                      });
                    },
                    staggeredTileBuilder: (index) {
                      if (controller.pageLoad.value &&
                          index >= controller.list.length) {
                        return StaggeredTile.count(
                            2, Get.width / (Get.height / 1));
                      } else {
                        return const StaggeredTile.fit(1);
                      }
                    }),
                onEndOfPage: () async {
                  await controller.getSearch(controller.currentPage.value,
                      controller.searchValue.value);
                });
          } else {
            if (controller.pageLoad.isTrue) {
              return const Center(
                child: LoadingScreen(),
              );
            } else {
              return Container();
            }
          }
        }),
        floatingActionButton: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            //show/hide animation
            opacity: controller.showButton.value ? 1.0 : 0.0,
            //set obacity to 1 on visible, or hide
            child: FloatingActionButton(
              onPressed: () {
                controller.scrollController.animateTo(
                    //go to top of scroll
                    0, //scroll offset to go
                    duration: const Duration(milliseconds: 500),
                    //duration of scroll
                    curve: Curves.fastOutSlowIn //scroll type
                    );
              },
              child: const Icon(Icons.arrow_upward),
            ),
          );
        }),
      ),
    );
  }

  searchBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      title: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: TextField(
          controller: controller.textController,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.search,
          focusNode: controller.focusNode,
          style: const TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            decoration: TextDecoration.none,
          ),
          onSubmitted: (value) async {
            controller.searchValue.value = value;
            controller.list.clear();
            await controller.getSearch(1, value);
          },
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              // contentPadding: EdgeInsets.zero,
              hintText: "",
              hintStyle: const TextStyle(fontSize: 20),
              prefixIcon: IconButton(
                onPressed: () {
                  if (controller.isKeyboardVisible) {
                    context.unFocus();
                  } else {
                    Get.back();
                  }
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(Get.context!).primaryIconTheme.color,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.textController.clear();
                  context.focus(controller.focusNode);
                },
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(Get.context!).primaryIconTheme.color,
                ),
              )),
        ),
      ),
    );
  }
}
