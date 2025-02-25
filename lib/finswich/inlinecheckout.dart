// import 'dart:html' as html;

// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // A flutter package to enhance statemanagement
// import 'package:webviewx_plus/webviewx_plus.dart';

// import '../constants.dart';

// // Open a dialog to the checkout screen
// // Get.dialog(Dialog(
// //   shape: RoundedRectangleBorder(
// //       borderRadius:
// //           BorderRadius
// //               .circular(
// //                   10)),
// //   insetPadding:
// //       const EdgeInsets
// //               .symmetric(
// //           horizontal: 20),
// //   child: Container(
// //     decoration:
// //         BoxDecoration(
// //       borderRadius:
// //           BorderRadius
// //               .circular(
// //                   20),
// //     ),
// //     height: 505,

// //     child:
// //          InlineCheckout(),//Inlinecheckout Page, this page loads the HTML as string
// //   ),
// // ));

// class InlineCheckout extends StatelessWidget {
//   final RxBool? val; // To know when the web view has finished loading

//   InlineCheckout({super.key, this.val}) {
//     Constants.logger.d(htmlString);
//     // print(htmlString);
//     Constants.logger.d(html.window.location.origin);
//   }

//   // var iframe = html.document.getElementsByTagName('iframe');

//   @override
//   Widget build(BuildContext context) {
//     // var observer = html.MutationObserver(((mutations, mutationobser) {
//     //   Constants.logger.d("observe");
//     //   for (var mutation in mutations) {
//     //     if (mutation.removedNodes.length > 0 &&
//     //         mutation.removedNodes[0].tagName == "IFRAME") {
//     //       Constants.logger.d("close");
//     //       val!.value = false;
//     //     }
//     //   }
//     // }));

//     // observer.observe(html.document, childList: true, subtree: true);
//     return Stack(
//       alignment: AlignmentDirectional.topEnd,
//       children: [
//         WebViewX(
//           initialContent: htmlString,
//           width: MediaQuery.sizeOf(context).width,
//           height: MediaQuery.sizeOf(context).height,
//           initialSourceType: SourceType.html,
//           onWebResourceError: (err) {
//             Constants.logger.d("This is web resource error${err.errorType}");
//           },
//           onWebViewCreated: (created) {
//             // created.;
//             Constants.logger.d("created");

//             // html.Element? checkoutiframe =
//             //     html.document.getElementById('\$_fswich_iframe');

//             // var observer = html.MutationObserver((mutations, observer) {
//             //   for (var mutation in mutations) {
//             //     // if (mutation.attributeName == 'style') {
//             //     //   var displayStyle = iframe.style.display;
//             //     //   if (displayStyle == 'none' || displayStyle == 'hidden') {
//             //     //     Constants.logger.d('Iframe is closed');
//             //     //     // Perform your action here
//             //     //   }
//             //     // }

//             //     if (mutation.removedNodes) {
//             //       mutation.removedNodes.forEach((node) {
//             //         if (node == iframe.first) {
//             //           Constants.logger.d('Iframe is closed2');
//             //           // Perform your action here
//             //         }
//             //       });
//             //     }

//             //     // if (mutation.removedNodes.length > 0 &&
//             //     //     mutation.removedNodes[0].tagName == "IFRAME") {}
//             //   }
//             // });

//             // observer.observe(checkoutiframe!, attributes: true);
//           },
//           onPageFinished: (finish) {
//             Constants.logger.d("page finished the load");

//             html.IFrameElement? iframe =
//                 html.document.querySelector('iframe') as html.IFrameElement?;

//             // Manipulate or interact with the iframe
//             // Example: print the src attribute
//             print('Found an iframe with src: $iframe');

//             Constants.logger.d(iframe);
//             Constants.logger.d(iframe!.contentWindow!);

//             // iframe?.contentWindow?.addEventListener("type", (event) {
//             //   Constants.logger.d(event.type);
//             //   return null;
//             // });

//             html.MutationObserver observer =
//                 html.MutationObserver((mutations, observer) {
//               Constants.logger.d('Observe');
//               for (var mutation in mutations) {
//                 for (var removedNode in mutation.removedNodes) {
//                   Constants.logger.d('An  has been removed1');

//                   if (removedNode is html.IFrameElement) {
//                     Constants.logger.d('An iframe element removed.');
//                     // Perform your function here
//                   }

//                   observer.disconnect();
//                 }
//               }
//             });

//             observer.observe(iframe,
//                 childList: true,
//                 attributes: true,
//                 subtree: true,
//                 characterData: true,
//                 characterDataOldValue: true,
//                 attributeOldValue: true);

//             // Constants.logger.d(iframeDocument);

//             // var iframe2 = iframe.querySelector('iframe');
//             // var iframe3 = iframe.querySelectorAll('iframe');
//             // Constants.logger.d("iframe2 ${iframe2?.id}");
//             // if (iframe2 != null) {
//             //   Constants.logger.d(iframe2.name);
//             // }

//             // Example: Call a JavaScript function
//             // js.context.callMethod('yourJavaScriptFunction', [iframe.src]);

//             // List<html.Node> iframes =
//             //     html.document.getElementsByTagName("iframe");

//             // Constants.logger.d(html.document.getElementsByName("iframe"));

//             // // html.Element? iframe =
//             // //     html.document.getElementById(r"$_fswich_iframe");
//             // // Create a MutationObserver to observe changes in the outer iframe's DOM
//             // html.MutationObserver observer =
//             //     html.MutationObserver((mutations, observer) {
//             //   for (var mutation in mutations) {
//             //     for (var removedNode in mutation.removedNodes) {
//             //       Constants.logger.d('An iframe has been removed1');

//             //       if (removedNode is html.IFrameElement) {
//             //         Constants.logger.d('An iframe has been removed.');
//             //         // Perform your function here
//             //       }
//             //       observer.disconnect();
//             //     }
//             //   }
//             // });

//             // Constants.logger.d(iframes.length);

//             // observer.observe(iframes.last,
//             //     childList: true, attributes: true, subtree: true);
//           },
//           dartCallBacks: {
//             DartCallback(
//               name: 'closecheckout',
//               callBack: (message) {
//                 Constants.logger.d(message);
//                 Constants.logger.d("Close checkout from JS");
//                 return val!.value = false;
//               },
//             ),
//           },
//         ),
//         Positioned(
//           top: MediaQuery.sizeOf(context).height / 4.7,
//           right: MediaQuery.sizeOf(context).width / 12.5,
//           child: WebViewAware(
//             debug: false,
//             child: GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: () {
//                   Constants.logger.d("Close checkout");
//                   val!.value = false;
//                 },
//                 child: const SizedBox(
//                   height: 70,
//                   width: 70,
//                 )),
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
