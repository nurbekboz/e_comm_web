import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Destek extends StatefulWidget {
  get keepAlive => true;

  @override
  _DestekState createState() => _DestekState();
}

class _DestekState extends State<Destek> with AutomaticKeepAliveClientMixin {
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
        if (request.url.startsWith('https://api.whatsapp.com/send/?phone=905362936408&text&type=phone_number&app_absent=0')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://api.whatsapp.com/send/?phone=905362936408&text&type=phone_number&app_absent=0'));
  @override
  bool get wantKeepAlive => widget.keepAlive;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "İletişim",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xffff2f8fb),
          elevation: 0,
        ),
        body: WebViewWidget(controller: controller)
    ));
  }
}
