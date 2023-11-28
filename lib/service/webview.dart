import 'package:fhm_globsl/service/pull.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewWidget extends StatefulWidget {
  final String initialUrl;

  const MyWebViewWidget({
    Key? key,
    required this.initialUrl,
  }) : super(key: key);

  @override
  State<MyWebViewWidget> createState() => _MyWebViewWidgetState();
}

class _MyWebViewWidgetState extends State<MyWebViewWidget>
        with WidgetsBindingObserver {

  WebViewController _controller = WebViewController();
  late DragGesturePullToRefresh dragGesturePullToRefresh; // Here

  @override
  void initState() {
    super.initState();

    dragGesturePullToRefresh = DragGesturePullToRefresh(); // Here
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Don't allow RefreshIndicator if page is loading, but not needed
            dragGesturePullToRefresh.started(); // Here
          },
          onPageFinished: (String url) {
            // Hide RefreshIndicator for page reload if showing
            dragGesturePullToRefresh.finished(); // Here
          },
          onWebResourceError: (WebResourceError error) {
            //debugPrint('MyWebViewWidget:onWebResourceError(): ${error.description}');
            // Hide RefreshIndicator for page reload if showing
            dragGesturePullToRefresh.finished(); // Here
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));

    dragGesturePullToRefresh // Here
            .setController(_controller)
            .setDragHeightEnd(200)
            .setDragStartYDiff(10)
            .setWaitToRestart(3000);

    //setState(() {});
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // remove listener
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: dragGesturePullToRefresh.refresh, // Here
      child: Builder(
        builder: (context) {
          // IMPORTANT: Use the RefreshIndicator context!
          dragGesturePullToRefresh.setContext(context); // Here
          return WebViewWidget(
            controller: _controller,
            // Add it to the WebViewWidget
            gestureRecognizers: {Factory(() => dragGesturePullToRefresh)}, // Here
          );
        },
      ),
    );
  }
}