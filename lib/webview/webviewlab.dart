import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewlab extends StatefulWidget {
  const Webviewlab({super.key});

  @override
  State<Webviewlab> createState() => _WebviewlabState();
}

class _WebviewlabState extends State<Webviewlab> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar (if necessary).
          },
          onPageStarted: (String url) {
            // Handle page start.
          },
          onPageFinished: (String url) {
            // Handle page finish.
          },
          onHttpError: (HttpResponseError error) {
            // Handle HTTP errors.
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource errors.
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web View Example')),
      body: WebViewWidget(controller: controller),
    );
  }
}
