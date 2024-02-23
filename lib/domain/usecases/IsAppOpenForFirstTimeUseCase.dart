import 'dart:async';

abstract class IsAppOpenForFirstTimeUseCase {
  // Check to see if the app has opened for the first time.
  Future<bool> isAppOpenForFirstTime();
}
