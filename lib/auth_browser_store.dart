// auth_browser_store.dart
class AuthBrowserStore {
  bool _isManuallyClosed = false;

  void setToManuallyClosed() {
    _isManuallyClosed = true;
  }

  bool get isManuallyClosed => _isManuallyClosed;
}
