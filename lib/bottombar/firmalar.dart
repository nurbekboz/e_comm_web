import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Firmalar extends StatefulWidget {
  get keepAlive => true;

  @override
  _FirmalarState createState() => _FirmalarState();
}

class _FirmalarState extends State<Firmalar>
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
        if (request.url.startsWith('https://www.mavikus.com.tr/store/sepetim')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://www.mavikus.com.tr/store/sepetim'));

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