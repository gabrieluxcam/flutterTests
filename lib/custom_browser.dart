import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gtm_test_app/auth_browser_store.dart';
import 'package:gtm_test_app/service_locator.dart';

// AuthBrowser class extending ChromeSafariBrowser
class AuthBrowser extends ChromeSafariBrowser {
  AuthBrowser();

  @override
  void onOpened() {
    // Optional: handle any initialization when the browser is opened
    print("AuthBrowser opened.");
  }

  @override
  void onClosed() {
    // Ensuring closure handling through dependency injection
    sl.get<AuthBrowserStore>().setToManuallyClosed();
    print("AuthBrowser closed and manually set as closed in store.");
  }
}
