import 'package:flutter_test/flutter_test.dart';

import 'TestApiDataSource.dart';

void main() {
  group('ApiDataSource', () {
    test('Should return 3 rockets', () {
      final apiDataSource = TestApiDataSource();
      apiDataSource.getRockets().then((rockets) => {expect(rockets.length, 3)});
    });

    test('1st rocket should have id of abc-123', () {
      final apiDataSource = TestApiDataSource();
      apiDataSource.getRockets().then((rockets) => {expect(rockets.first.id, 'abc-123')});
    });

    test("2nd rocket should have name Space Oddity", () {
      final apiDataSource = TestApiDataSource();
      apiDataSource.getRockets().then((rockets) => {expect(rockets[1].name, "Space Oddity")});
    });
  });
}
