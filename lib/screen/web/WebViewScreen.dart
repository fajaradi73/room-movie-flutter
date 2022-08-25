// ignore_for_file: must_be_immutable

/*
 * room_movie
 *     WebViewScreen.dart
 *     Created by Fajar Adi Prasetyo on 24/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  var title = "";
  var isNight = false;

  WebViewScreen(this.title, this.isNight, {Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var loadingPercentage = 0;
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
          preferredContentMode: UserPreferredContentMode.DESKTOP),
      android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
          textZoom: 100 * 2 // it makes 2 times bigger
          ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialFile: loadHtmlFromAssets(),
              initialUserScripts: UnmodifiableListView<UserScript>([]),
              initialOptions: options,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
            progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ],
        ));
  }

  loadHtmlFromAssets() {
    String fileText = "";
    if (widget.title.contains("Privasi")) {
      if (widget.isNight) {
        fileText = 'assets/html/privacy_policy_dark.html';
      } else {
        fileText = 'assets/html/privacy_policy.html';
      }
    } else if (widget.title.contains("Syarat")) {
      fileText = 'assets/html/term_of_use.html';
      if (widget.isNight) {
        fileText = 'assets/html/term_of_use_dark.html';
      } else {
        fileText = 'assets/html/term_of_use.html';
      }
    } else {
      if (widget.isNight) {
        fileText = 'assets/html/contribution_dark.html';
      } else {
        fileText = 'assets/html/contribution.html';
      }
    }
    return fileText;
  }
}
