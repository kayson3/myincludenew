// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:includenew/constants.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';
// import 'package:webviewx_plus/webviewx_plus.dart';

// class InlineCheckouttt extends StatelessWidget {
//   final RxBool? val;
//   InlineCheckouttt({super.key, this.val}) {
//     Constants.logger.d(Constants.store.read("KYCDATA")['kyc_url']);
//     // html.window.onMessage
//   }

//   WebWebViewController controller = WebWebViewController(
//       WebWebViewControllerCreationParams())
//     // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     // ..setBackgroundColor(const Color(0x00000000))
//     // ..addJavaScriptChannel(JavaScriptChannelParams(
//     //   name: 'Flutter',
//     //   onMessageReceived: (JavaScriptMessage message) {
//     //     // Handle messages received from JavaScript
//     //     if (message.message == 'Close') {
//     //       // Close or remove the Flutter widget or perform any other action
//     //       Constants.logger.d("Close checkout....");
//     //       // val!.value = false;
//     //     }
//     //   },
//     // ))
//     // ..loadHtmlString(htmlString).then((value) {
//     //   Constants.logger.d("page finished loading");

//     //   html.Element? iframe = html.document.querySelector('iframe');

//     //   if (iframe != null) {
//     //     // Manipulate or interact with the iframe
//     //     // Example: print the src attribute
//     //     print('Found an iframe with src: $iframe');

//     //     Constants.logger.d(iframe);
//     //     return null;
//     //   }
//     // }

//     // )
//     ..loadRequest(LoadRequestParams(
//         uri: Uri.parse(
//             "https://checkout-1.fuspay.finance/?reference=65a9033e3edd2c68126a8fb4&public_key=live_public_8bf7ae2cae32405375135a9fcbd449b178587hodbpmbXvQSUX6Zyp4cPnCwSL7XFT9drk77IzOUepTA8g0Zne9ARPjBOX2ahKDdU17055&balance=2400&origin=http://127.0.0.1:5500")));

//   // final PlatformWebViewController _controller = PlatformWebViewController(
//   //   const PlatformWebViewControllerCreationParams(),
//   // )
//   //   // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   //   // ..setBackgroundColor(const Color(0x00000000))
//   //   ..loadHtmlString(htmlString);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topEnd,
//       children: [
//         WebWebViewWidget(
//           PlatformWebViewWidgetCreationParams(controller: controller),
//         ).build(context),
//         Positioned(
//           top: MediaQuery.sizeOf(context).height / 4.7,
//           right: MediaQuery.sizeOf(context).width / 12.5,
//           child: WebViewAware(
//             debug: false,
//             child: GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onTap: () {
//                 Constants.logger.d("Close checkout");
//                 val!.value = false;
//               },
//               child: const SizedBox(
//                 height: 70,
//                 width: 70,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// String ref =
//     "emcodeApp001Live"; //Constants.store.read('LOGININFO')['checkout']['reference'];

// String publickey =
//     "live_public_f1f453b175384d3d08509809e9100823120dbXUnU8daZBBM5Cye3F0AryQVhbB5DWRwF9S0p5spFdBFIy8gZupLuwO5n2sO29nPN16875"; //Constants.store.read('LOGININFO')['checkout']['public_key'];

// String origin =
//     "https://exchanger-api.fuspay.finance"; //html.window.location.origin;
// String domain =
//     "https://fin-swich-checkout.vercel.app"; //Constants.checkouturlUrl;

// String balance = Constants.store.read("USERWALLET")['balance'].toString();

// //https://exchanger-api.fuspay.finance

// // public_key: "$publickey",

// String htmlString = '''
// <!DOCTYPE html>
// <html lang="en">

// <head>
//   <meta charset="UTF-8" />
//   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
//   <meta http-equiv="X-UA-Compatible" content="ie=edge" />
//   <title>Static Template</title>
// </head>

// <body>

//   <script src="https://exchanger-api.fuspay.finance/finswich/inline.js"></script>
//   <script>
//     const init_option = {
//       reference: "$ref",
//       public_key:"$publickey",
//       balance: "$balance",
//       origin: "$origin",
//       base: "/?reference=$ref&public_key=$publickey&balance=$balance&origin=$origin",
//       domain: "$domain",
//     };

//     //Open - Is any function that can call the JS \$_fswich function
//     function Open(init_option) {
//       //: function called from finswich inline js that is embeded on this page
//       if (typeof \$_fswich == "function") {
//         \$_fswich(init_option);
//       }
//     }

//     window.onload = Open.apply(null, [init_option]);
//   </script>
// </body>

// </html>

// ''';
