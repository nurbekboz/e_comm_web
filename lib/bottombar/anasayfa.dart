import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Anasayfa extends StatefulWidget {
  get keepAlive => true;

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with AutomaticKeepAliveClientMixin {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (
          int progress,
        ) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) async {
          if (request.url.startsWith('https://api.whatsapp.com/send?phone')) {
            print('blocking navigation to $request}');
            List<String> urlSplitted = request.url.split("&text=");

            String phone = "905362936408";
            String message = urlSplitted.last.toString().replaceAll("%20", " ");

            await _launchURL("https://wa.me/$phone/?text=${Uri.parse(message)}");
            return NavigationDecision.prevent;
          }

          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.mavikus.com.tr/store/'));

  @override
  bool get wantKeepAlive => widget.keepAlive;
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
        
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  
        // initialUrl: "https://onaykodu.net/blog/",
        // javascriptMode: JavascriptMode.unrestricted,