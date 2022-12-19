import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListBuilder extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Axis? scrollDirection;

  const AnimatedListBuilder({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = true,
    this.physics,
    this.scrollDirection,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
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
      ),
    );
  }
}
