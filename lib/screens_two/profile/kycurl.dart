// import 'package:flutter/material.dart';
// import 'package:includenew/constants.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';

// class KYCurl extends StatelessWidget {
//   KYCurl({super.key}) {
//     Constants.logger.d(Constants.store.read("KYCDATA")['kyc_url']);
//   }

//   WebWebViewController controller =
//       WebWebViewController(WebWebViewControllerCreationParams())
//         // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         // ..setBackgroundColor(const Color(0x00000000))
//         ..loadRequest(LoadRequestParams(
//             uri: Uri.parse(Constants.store.read("KYCDATA")['kyc_url'])));

//   // final PlatformWebViewController _controller = PlatformWebViewController(
//   //   const PlatformWebViewControllerCreationParams(),
//   // )
//   //   // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   //   // ..setBackgroundColor(const Color(0x00000000))
//   //   ..loadHtmlString(htmlString);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 700,
//       width: MediaQuery.sizeOf(context).width,
//       // height: MediaQuery.sizeOf(context).height,
//       padding: const EdgeInsets.all(5),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//             top: Radius.circular(20)), // Customizing the container
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 112,
//             decoration: const ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   width: 4,
//                   strokeAlign: BorderSide.strokeAlignCenter,
//                   color: Color(0xFFCACACA),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Expanded(
//             child: WebWebViewWidget(
//               PlatformWebViewWidgetCreationParams(controller: controller),
//             ).build(context),
//           ),
//         ],
//       ),

//       // The below code shows an indicator once the webview is loading state
//       // Obx(
//       //   () => progressint.value != 100
//       //       ? const SpinKitFadingCube(
//       //           size: 15,
//       //           color: Color(0xff293B96),
//       //         )
//       //       : const SizedBox(),
//       // ),
//     );
//   }
// }
