import 'package:get_it/get_it.dart';
import 'auth_browser_store.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<AuthBrowserStore>(() => AuthBrowserStore());
}
