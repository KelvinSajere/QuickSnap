import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicksnap/screens/home/home_page.dart';

void main() {
  testWidgets('Home Page Test UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));
    //check if Home Page contains title
    expect(
        find.descendant(of: find.byType(AppBar), matching: find.text('Home')),
        findsOneWidget);
    //check the floating button
    expect(find.widgetWithIcon(FloatingActionButton, Icons.contact_mail),
        findsOneWidget);
  });
}
