import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("In-App WebView"),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: WebUri(url)), // Corrected to use WebUri
        onWebViewCreated: (InAppWebViewController controller) {},
      ),
    );
  }
}
