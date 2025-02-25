import 'dart:async';
// import 'package:universal_html/html.dart' as html;
import 'dart:html';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includenew/constants.dart';

class FinswichIframe extends StatelessWidget {
  final RxBool ischeckoutVisible;
  final String reference;
  final String publicKey;
  final String balance;
  final String origin;
  FinswichIframe(
      {super.key,
      required this.ischeckoutVisible,
      required this.balance,
      required this.origin,
      required this.publicKey,
      required this.reference}) {
    StreamSubscription<MessageEvent>? messageSubscription;

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => IFrameElement()
        ..className = "MyIframe"
        ..id = r"$_fswich_iframe"
        ..src =
            "${Constants.checkouturlUrl}/?reference=$reference&public_key=$publicKey&balance=$balance&origin=$origin"
        ..style.border = 'none' // Optional for removing border
        ..allowFullscreen = false,
    );

    messageSubscription = window.onMessage.listen((event) {
      // final iframe = ui.platformViewRegistry.getViewById(useableviewId!);
      Constants.logger.d(event.data);

      html.Element? checkoutiframe =
          document.getElementById(r"$_fswich_iframe");
      Constants.logger.d(event.source == checkoutiframe);

      Constants.logger.d(
          "${Constants.checkouturlUrl}/?reference=$reference&public_key=$publicKey&balance=$balance&origin=$origin");

      if (event.data["name"] == "Close") {
        // Remove the iframe
        Constants.logger.d("Closing iframe");
        checkoutiframe?.parent?.remove();
        ischeckoutVisible.value = false;
        messageSubscription?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      // width: 600,

      child: HtmlElementView(
          viewType: 'iframeElement', onPlatformViewCreated: (v) {}),
    );
  }
}
