
import 'package:flutter_test/flutter_test.dart';
import 'package:gormund/main.dart'; // Import your main.dart file correctly

Future<void> main() async {
  testWidgets('Find Get Started Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the "Get Started" button is present.
    expect(find.text('Get Started'), findsOneWidget);

    // You can also add more tests here to verify other functionalities,
    // like navigation when the button is pressed, by mocking the Navigator
    // and checking if it's called with the right arguments.
  });
}
