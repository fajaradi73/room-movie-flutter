import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:room_movie/helper/extensions.dart';

class GlobalHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String title;
  final Widget? leading;
  final double? height;
  final Widget? titleWidget;
  final List<Widget> action;

  const GlobalHeader({
    super.key,
    this.title = 'Title',
    this.showBackButton = true,
    this.leading,
    this.height,
    this.titleWidget,
    this.action = const [],
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              (leading != null).either(
                trueV: leading,
                falseV: showBackButton.either(
                  trueV: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      IconlyLight.arrow_left,
                      // color: ColorName.appBlack,
                    ),
                  ),
                  falseV: null,
                ),
              ),
              SizedBox(width: 2.0.width()),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: (titleWidget != null).either(
                  trueV: titleWidget,
                  falseV: Text(
                    (this).title,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 3.5.width()),
            child: Row(
              children: (this).action,
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalTypeHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String title;
  final Widget? leading;
  final double? height;
  final Widget? titleWidget;
  const GlobalTypeHeader({
    super.key,
    this.title = 'Title',
    this.showBackButton = true,
    this.leading,
    this.height,
    this.titleWidget,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (leading != null).either(
            trueV: leading,
            falseV: showBackButton.either(
              trueV: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  IconlyLight.arrow_left_2,
                  // color: ColorName.appBlack,
                ),
              ),
              falseV: null,
            ),
          ),
          SizedBox(width: 2.0.width()),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: (titleWidget != null).either(
              trueV: titleWidget,
              falseV: Text(
                (this).title,
              ),
            ),
          ),
        ],
      ),
      // leading:
    );
  }
}
