import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Bakiye extends StatefulWidget {
  get keepAlive => true;

  @override
  _BakiyeState createState() => _BakiyeState();
}

class _BakiyeState extends State<Bakiye>
    with AutomaticKeepAliveClientMixin {
            WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://trendmedyam.com/addfunds')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://trendmedyam.com/addfunds'));

  @override
  bool get wantKeepAlive => widget.keepAlive;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: WebViewWidget(
        controller: controller,

      ),
    );
  }
}

        // initialUrl: "https://onaykodu.net/panel/buy",
        // javascriptMode: JavascriptMode.unrestricted,