import 'dart:async';

abstract class ConfigRepository {
  // Is it the first time the app is open.
  Future<bool> isAppOpenForFirstTime();

  // Set whether it's the first time the app is open
  void setAppOpenForFirstTime();
}
