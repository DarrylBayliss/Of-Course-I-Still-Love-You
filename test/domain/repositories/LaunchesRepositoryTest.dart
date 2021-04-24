
import 'package:flutter_test/flutter_test.dart';

import 'TestLaunchesRepository.dart';

void main() {
  group('LaunchesRepository', () {
    test('Should return 3 rockets when calling getRockets', () {
      final testLaunchesRepository = TestLaunchesRepository();
      testLaunchesRepository.getRockets().then((rockets) => expect(rockets.length, 3));
    });

    test('Should return 3 rocket launches when calling getLaunchesForRocket', () {
      final testLaunchesRepository = TestLaunchesRepository();
      testLaunchesRepository.getLaunchesForRocket("abc-123").then((rocketLaunches) => expect(rocketLaunches.length, 3));
    });
  });
}