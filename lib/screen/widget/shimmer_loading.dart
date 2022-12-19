import 'package:flutter/material.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/widget/shimmer.dart';

import 'animated_size_switcher.dart';

class ShimmerSwitch extends StatelessWidget {
  final Stream<bool>? stream;
  final Widget child;

  const ShimmerSwitch({
    super.key,
    this.stream,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: (this).stream,
      builder: (context, snap) {
        return AnimatedSwitcherSize(
          fadeDuration: const Duration(milliseconds: 300),
          sizeDuration: const Duration(milliseconds: 300),
          child: (snap.hasData && snap.data == true).either(
            trueV: Shimmer.fromColors(
              period: const Duration(milliseconds: 2000),
              baseColor: ColorName.shimmerBG.withOpacity(0.7),
              highlightColor: Colors.grey.shade200,
              child: IgnorePointer(
                ignoring: true,
                child: child,
              ),
            ),
            falseV: child,
          ),
        );
      },
    );
  }
}

class ShimmerChild extends StatelessWidget {
  final Widget child;

  const ShimmerChild({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: ColorName.shimmerBG.withOpacity(0.7),
      highlightColor: Colors.grey.shade200,
      child: IgnorePointer(
        ignoring: true,
        child: child,
      ),
    );
  }
}

class SwitcherBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const SwitcherBuilder({
    super.key,
    required this.builder,
    this.fadeDuration = const Duration(milliseconds: 500),
    this.sizeDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).builder(),
    );
  }
}

class SwitcherWidget extends StatelessWidget {
  final Widget child;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const SwitcherWidget({
    super.key,
    required this.child,
    this.fadeDuration = const Duration(milliseconds: 500),
    this.sizeDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).child,
    );
  }
}
