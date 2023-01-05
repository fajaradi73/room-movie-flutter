// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnimatedStaggerBuilder extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int? itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Axis? scrollDirection;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final ScrollController? controller;
  final StaggeredTile Function(int) staggeredTileBuilder;

  const AnimatedStaggerBuilder(
      {Key? key,
      this.padding = EdgeInsets.zero,
      this.shrinkWrap = true,
      this.physics,
      this.scrollDirection,
      this.controller,
      this.crossAxisSpacing = 0,
      this.mainAxisSpacing = 0,
      required this.itemCount,
      required this.itemBuilder,
      required this.crossAxisCount,
      required this.staggeredTileBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        padding: padding,
        itemCount: itemCount,
        shrinkWrap: shrinkWrap,
        scrollDirection: scrollDirection ?? Axis.vertical,
        physics: physics,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              // horizontalOffset: 50.0,
              verticalOffset: 20.0,
              child: FadeInAnimation(
                child: itemBuilder(context, index),
              ),
            ),
          );
        },
        staggeredTileBuilder: staggeredTileBuilder,
      ),
    );
  }
}
