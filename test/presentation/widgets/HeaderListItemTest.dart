
import 'package:flutter_test/flutter_test.dart';
import 'package:of_course_i_still_love_you/presentation/widgets/HeaderListItem.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('HeaderListItemTest has a title', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(HeaderListItem("Heading"));

    // Create finder
    final titleFind = find.text("Heading");
  });
}