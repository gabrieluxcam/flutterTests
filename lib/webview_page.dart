import 'package:flutter/material.dart';
import 'inappwebviewscreen.dart';
import 'custom_browser.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final AuthBrowser browser = AuthBrowser(); // Using the AuthBrowser class

  WebViewPage({Key? key, required this.url}) : super(key: key);

  Future<void> openChromeBrowser() async {
    await browser.open(
      url: WebUri.uri(Uri.parse(url)), // Convert Uri to WebUri
      settings: ChromeSafariBrowserSettings(
        toolbarBackgroundColor: Colors.deepPurple,
        navigationBarColor: Colors.black,
        showTitle: true,
        enableUrlBarHiding: true,
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.blueGrey,
        preferredControlTintColor: Colors.white,
        transitionStyle: ModalTransitionStyle.CROSS_DISSOLVE,
        presentationStyle: ModalPresentationStyle.FULL_SCREEN,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View Options"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: openChromeBrowser,
              child: const Text("Open in Chrome Custom Tab"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InAppWebViewScreen(url: url),
                ),
              ),
              child: const Text("Open In-App WebView"),
            ),
          ],
        ),
      ),
    );
  }
}
