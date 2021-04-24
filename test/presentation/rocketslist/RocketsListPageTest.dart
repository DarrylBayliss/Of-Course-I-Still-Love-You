import 'package:flutter_driver/flutter_driver.dart' as flutterDriver;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Of Course I Still Love You App', () {

    final titleTextFinder = flutterDriver.find.text("Rockets");

    flutterDriver.FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await flutterDriver.FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('First page title is Rockets', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(titleTextFinder), "Rockets");
    });
  });
}
