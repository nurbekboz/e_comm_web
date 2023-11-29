// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Destek extends StatefulWidget {
//   get keepAlive => true;

//   @override
//   _DestekState createState() => _DestekState();
// }

// class _DestekState extends State<Destek> with AutomaticKeepAliveClientMixin {
//       WebViewController controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   ..setBackgroundColor(const Color(0x00000000))
//   ..setNavigationDelegate(
//     NavigationDelegate(
//       onProgress: (int progress) {
//         // Update loading bar.
//       },
//       onPageStarted: (String url) {},
//       onPageFinished: (String url) {},
//       onWebResourceError: (WebResourceError error) {},
//       onNavigationRequest: (NavigationRequest request) {
//         if (request.url.startsWith('https://trendmedyam.com/iletisim/')) {
//           return NavigationDecision.prevent;
//         }
//         return NavigationDecision.navigate;
//       },
//     ),
//   )
//   ..loadRequest(Uri.parse('https://trendmedyam.com/iletisim/'));

//   @override
//   bool get wantKeepAlive => widget.keepAlive;
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SafeArea(
//       child: WebViewWidget(controller: controller,

//       ),
//     );
//   }
// }

