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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  var title = "";
  var isNight = false;

  WebViewScreen(this.title, this.isNight, {Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var loadingPercentage = 0;
  late WebViewController controller;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
            loadHtmlFromAssets();
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ]),
    );
  }

  loadHtmlFromAssets() async {
    String fileText = "";
    if (widget.title.contains("Privasi")) {
      if (widget.isNight) {
        fileText =
            await rootBundle.loadString('assets/html/privacy_policy_dark.html');
      } else {
        fileText =
            await rootBundle.loadString('assets/html/privacy_policy.html');
      }
    } else if (widget.title.contains("Syarat")) {
      fileText = await rootBundle.loadString('assets/html/term_of_use.html');
      if (widget.isNight) {
        fileText =
            await rootBundle.loadString('assets/html/term_of_use_dark.html');
      } else {
        fileText = await rootBundle.loadString('assets/html/term_of_use.html');
      }
    } else {
      if (widget.isNight) {
        fileText =
            await rootBundle.loadString('assets/html/contribution_dark.html');
      } else {
        fileText = await rootBundle.loadString('assets/html/contribution.html');
      }
    }
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
