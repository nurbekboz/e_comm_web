import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GizlililikPolitikasi extends StatefulWidget {
  get keepAlive => true;

  @override
  _GizlililikPolitikasiState createState() => _GizlililikPolitikasiState();
}

class _GizlililikPolitikasiState extends State<GizlililikPolitikasi> with AutomaticKeepAliveClientMixin {
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
        if (request.url.startsWith('https://www.mavikus.com.tr/store/gizlilik-ilkeleri')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://www.mavikus.com.tr/store/gizlilik-ilkeleri'));
  @override
  bool get wantKeepAlive => widget.keepAlive;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text(
            "Gizlilik Politikası",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xfff161B22),
          elevation: 0,
        ),
        body: WebViewWidget(controller: controller)
    ));
  }
}
