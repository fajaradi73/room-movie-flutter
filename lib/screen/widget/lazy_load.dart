import 'package:flutter/material.dart';

enum LoadingStatus { loading, stable }

/// Signature for EndOfPageListeners
typedef EndOfPageListenerCallback = void Function();

/// A widget that wraps a [Widget] and will trigger [onEndOfPage] when it
/// reaches the bottom of the list
class LazyLoad extends StatefulWidget {
  /// The [Widget] that this widget watches for changes on
  final Widget child;

  /// Called when the [child] reaches the end of the list
  final EndOfPageListenerCallback onEndOfPage;

  /// The offset to take into account when triggering [onEndOfPage] in pixels
  final int scrollOffset;

  /// Used to determine if loading of new data has finished. You should use set this if you aren't using a FutureBuilder or StreamBuilder
  final bool isLoading;

  /// Prevented update nested listview with other axis direction
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() => LazyLoadState();

  const LazyLoad({
    Key? key,
    required this.child,
    required this.onEndOfPage,
    this.scrollDirection = Axis.vertical,
    this.isLoading = false,
    this.scrollOffset = 100,
  }) : super(key: key);
}

class LazyLoadState extends State<LazyLoad> {
  LoadingStatus loadMoreStatus = LoadingStatus.stable;

  @override
  void didUpdateWidget(LazyLoad oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading) {
      loadMoreStatus = LoadingStatus.stable;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: widget.child,
      onNotification: (notification) => _onNotification(notification, context),
    );
  }

  bool _onNotification(ScrollNotification notification, BuildContext context) {
    if (widget.scrollDirection == notification.metrics.axis) {
      if (notification is ScrollUpdateNotification) {
        if (notification.metrics.maxScrollExtent >
                notification.metrics.pixels &&
            notification.metrics.maxScrollExtent -
                    notification.metrics.pixels <=
                widget.scrollOffset) {
          _loadMore();
        }
        return true;
      }

      if (notification is OverscrollNotification) {
        if (notification.overscroll > 0) {
          _loadMore();
        }
        return true;
      }
    }
    return false;
  }

  void _loadMore() {
    if (loadMoreStatus == LoadingStatus.stable) {
      loadMoreStatus = LoadingStatus.loading;
      widget.onEndOfPage();
    }
    // widget.onEndOfPage();
  }
}
