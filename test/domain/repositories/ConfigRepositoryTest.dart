
import 'package:flutter_test/flutter_test.dart';

import 'TestConfigRepository.dart';

void main() {
  group('ConfigRepository', () {
    test('Should return false when calling isAppOpenForFirstTime', () {
      final testConfigRepository = TestConfigRepository();
      testConfigRepository.isAppOpenForFirstTime().then((appOpenForFirstTime) => expect(appOpenForFirstTime, false));
    });

    test('Should return true when calling isAppOpenForFirstTime', () {
      final testConfigRepository = TestConfigRepository();
      testConfigRepository.setAppOpenForFirstTime();
      testConfigRepository.isAppOpenForFirstTime().then((appOpenForFirstTime) => expect(appOpenForFirstTime, true));
    });
  });
}