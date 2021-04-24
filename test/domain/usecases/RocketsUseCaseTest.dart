
import 'package:flutter_test/flutter_test.dart';

import 'TestRocketsUseCase.dart';

void main() {
  group('RocketUseCase', () {
    test('Should return 3 rockets when calling getLaunchesForRocket', () {
      final testRocketsUseCase = TestRocketsUseCase();
      testRocketsUseCase.getRockets().then((rocketLaunches) => expect(rocketLaunches.length, 3));
    });

    test('Should return false when calling isAppOpenForFirstTime', () {
      final testRocketsUseCase = TestRocketsUseCase();
      testRocketsUseCase.isAppOpenForFirstTime().then((appOpenForFirstTime) => expect(appOpenForFirstTime, false));
    });

    test('Should return true after calling setAppOpenForFirstTime', () {
      final testRocketsUseCase = TestRocketsUseCase();
      testRocketsUseCase.setAppOpenForFirstTime();
      testRocketsUseCase.isAppOpenForFirstTime().then((appOpenForFirstTime) => expect(appOpenForFirstTime, true));
    });
  });
}