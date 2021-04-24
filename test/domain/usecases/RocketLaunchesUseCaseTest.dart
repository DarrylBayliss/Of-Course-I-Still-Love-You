
import 'package:flutter_test/flutter_test.dart';
import 'package:of_course_i_still_love_you/domain/entities/Rocket.dart';

import 'TestRocketLaunchesUseCase.dart';

void main() {
  group('RocketLaunchesUseCase', () {
    test('Should return 3 launches when calling getLaunchesForRocket', () {
      final testRocketLaunchesUseCase = TestRocketLaunchesUseCase();
      final rocket = Rocket();
      testRocketLaunchesUseCase.getLaunchesForRocket(rocket).then((rocketLaunches) => expect(rocketLaunches.length, 3));
    });
  });
}