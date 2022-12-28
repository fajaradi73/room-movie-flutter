/*
 * room_movie
 *     extensions.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../screen/widget/snackbar_widget.dart';
import '../theme/responsives.dart';

extension AppSizer on double {
  double width([double? tablet]) {
    if (Responsive.isTablet()) {
      return tablet?.w ?? (this).w;
    } else {
      return (this).w;
    }
  }

  double height([double? tablet]) {
    if (Responsive.isTablet()) {
      return tablet?.h ?? (this).h;
    } else {
      return (this).h;
    }
  }

  double fontSize({
    double? tablet,
    bool isFixedSize = false,
  }) {
    if (isFixedSize) {
      if (Responsive.isTablet()) {
        return tablet ?? (this);
      } else {
        return (this);
      }
    } else {
      if (Responsive.isTablet()) {
        return tablet?.sp ?? (this).sp;
      } else {
        return (this).sp;
      }
    }
  }
}

extension AppSizerContext on BuildContext {
  double get inset {
    return (this).mediaQuery.viewInsets.bottom;
  }
}

extension TextCo on TextEditingController? {
  void val(String text) {
    if ((this) != null) {
      (this)!.text = text;
    }
  }

  TextEditingController? add(String text) {
    if ((this) != null) {
      return (this)?..text = text;
    } else {
      return null;
    }
  }
}

extension Test on GetInterface {
  // String get string => (this).arguments as String;

  // StatusType get type => (this).arguments['type'];

  void error(String message, [String title = 'ERROR']) {
    Get.snackbar(
      title,
      message,
      borderRadius: 8,
      colorText: Colors.white,
      backgroundColor: Colors.red.withOpacity(0.7),
    );
  }

  void success(String message, [String title = 'SUCCESS']) {
    Get.snackbar(
      title,
      message,
      borderRadius: 8,
      colorText: Colors.white,
      backgroundColor: Colors.green.withOpacity(0.7),
    );
  }
}

extension ExString on String? {
  bool equal(String compared) {
    if ((this) != null) {
      return (this) == compared;
    } else {
      return false;
    }
  }

  bool notEqual(String compared) {
    if ((this) != null) {
      return (this) != compared;
    } else {
      return false;
    }
  }

  String? get nullIfEmpty {
    if ((this) != null) {
      if ((this)!.isNotEmpty) {
        return (this);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String? dateFormat({
    required String currentFormat,
    required String desiredFormat,
  }) {
    if ((this) != null) {
      try {
        String formattedDate = "";
        DateTime dateTime = DateFormat(currentFormat).parse((this!), true);
        formattedDate = DateFormat(desiredFormat).format(dateTime);
        return formattedDate.toString();
      } catch (e) {
        return '';
      }
    } else {
      return '';
    }
  }

  DateTime? toDate([String format = 'dd/MM/yyyy']) {
    if ((this) != null) {
      return DateFormat(format).parse(this!);
    } else {
      return null;
    }
  }
}

extension CommonBool on bool? {
  dynamic either({required dynamic trueV, required dynamic falseV}) {
    if ((this) != null) {
      if ((this) == true) {
        return trueV;
      } else {
        return falseV;
      }
    } else {
      return falseV;
    }
  }

  bool or(bool another) {
    if ((this) != null) {
      return ((this)! || another);
    } else {
      return false;
    }
  }

  bool and(bool another) {
    if ((this) != null) {
      return ((this)! && another);
    } else {
      return false;
    }
  }

  Widget widget({required Widget trueV, required Widget falseV}) {
    if ((this) != null) {
      if ((this) == true) {
        return trueV;
      } else {
        return falseV;
      }
    } else {
      return falseV;
    }
  }
}

//TOPBAR
OverlayEntry? _previousEntry;

extension TopBar on BuildContext {
  void showTopDone(
    String message, {
    Duration showOutAnimationDuration = const Duration(milliseconds: 1200),
    Duration hideOutAnimationDuration = const Duration(milliseconds: 550),
    Duration displayDuration = const Duration(seconds: 3),
    double additionalTopPadding = 0.0,
    VoidCallback? onTap,
    OverlayState? overlayState,
    double leftPadding = 0.0,
    double rightPadding = 0.0,
  }) {
    overlayState ??= Overlay.of(this);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return DismissableTopSnackBar(
          type: TBarType.success,
          message: message,
          onDismissed: () {
            overlayEntry.remove();
            _previousEntry = null;
          },
          showOutAnimationDuration: showOutAnimationDuration,
          hideOutAnimationDuration: hideOutAnimationDuration,
          displayDuration: displayDuration,
          additionalTopPadding: additionalTopPadding,
          onTap: onTap,
          leftPadding: leftPadding,
          rightPadding: rightPadding,
        );
      },
    );

    _previousEntry?.remove();
    overlayState?.insert(overlayEntry);
    _previousEntry = overlayEntry;
  }

  void showTopFail(
    String message, {
    Duration showOutAnimationDuration = const Duration(milliseconds: 1200),
    Duration hideOutAnimationDuration = const Duration(milliseconds: 550),
    Duration displayDuration = const Duration(seconds: 3),
    double additionalTopPadding = 0.0,
    VoidCallback? onTap,
    OverlayState? overlayState,
    double leftPadding = 0.0,
    double rightPadding = 0.0,
  }) {
    overlayState ??= Overlay.of(this);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return DismissableTopSnackBar(
          type: TBarType.error,
          message: message,
          onDismissed: () {
            overlayEntry.remove();
            _previousEntry = null;
          },
          showOutAnimationDuration: showOutAnimationDuration,
          hideOutAnimationDuration: hideOutAnimationDuration,
          displayDuration: displayDuration,
          additionalTopPadding: additionalTopPadding,
          onTap: onTap,
          leftPadding: leftPadding,
          rightPadding: rightPadding,
        );
      },
    );

    _previousEntry?.remove();
    overlayState?.insert(overlayEntry);
    _previousEntry = overlayEntry;
  }

  void unFocus() {
    if (FocusScope.of(this).hasFocus) {
      FocusScope.of(this).unfocus();
    }
  }

  void getunFocus() {
    if (FocusScope.of(this).hasFocus) {
      FocusScope.of(this).unfocus();
    }
  }
}

extension DoubleExt on double {
  String toEuro() {
    return NumberFormat.simpleCurrency(
      name: 'EUR',
    ).format(this / 100);
  }

  String toPln() {
    return NumberFormat.simpleCurrency(
      name: 'PLN',
    ).format(this / 100);
  }

  String toDollar() {
    return NumberFormat.simpleCurrency(
      name: "US",
    ).format(this / 100);
  }
}

extension IntegerExt on int {
  String toIntEuro() {
    return NumberFormat.simpleCurrency(
      name: 'EUR',
    ).format(this / 100);
  }

  String toIntPln() {
    return NumberFormat.simpleCurrency(
      name: 'PLN',
    ).format(this / 100);
  }

  String toIntDollar() {
    return NumberFormat.simpleCurrency(
      name: "US",
    ).format(this / 100);
  }
}

extension Maps on Map<String, dynamic> {
  int get idMovie => (this)['idMovie'];
}
