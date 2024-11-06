import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewScreen extends StatelessWidget {
  final String url;

  const InAppWebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In-App WebView")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
      ),
    );
  }
}
