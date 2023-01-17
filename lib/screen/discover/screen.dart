// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 17/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/discover/bloc.dart';
import 'package:room_movie/screen/discover/list_item.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';
import 'package:room_movie/screen/widget/animated_stagger_builder.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';
import 'package:room_movie/screen/widget/lazy_load.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

class DiscoverScreen extends GetView<DiscoverBloc> {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(controller.title.value.capitalize.toString());
        }),
      ),
      body: Obx(() {
        return Column(
          children: [
            SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            //Add isDense true and zero Padding.
                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          ),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down_rounded,
                          ),
                          iconSize: 40,
                          buttonHeight: 50,
                          buttonPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: controller.typeItems
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: controller.dropDownValue.value,
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                            controller.dropDownValue.value = value.toString();
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: Get.width,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                            onTap: () {},
                            child: Container(
                                width: Get.width,
                                height: 50,
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 4,
                                      child: SizedBox(
                                        width: Get.width,
                                        child: const Text(
                                          "Urutkan",
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: SizedBox(
                                            width: Get.width,
                                            child: const Icon(
                                              Icons.arrow_drop_down_rounded,
                                              size: 40,
                                            )))
                                  ],
                                ))),
                      ),
                    ),
                  ],
                )),
            (controller.list.isNotEmpty)
                ? Expanded(
                    child: LazyLoad(
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
                                  return DiscoverListItem(
                                      data: data, isMovie: controller.isMovie);
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
                          await controller.getDiscover(
                              controller.currentPage.value,
                              controller.sortBy.value,
                              controller.genre.value,
                              controller.keyword.value,
                              controller.network.value);
                        }),
                  )
                : const Center(
                    child: LoadingScreen(),
                  )
          ],
        );
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
    );
  }
}
