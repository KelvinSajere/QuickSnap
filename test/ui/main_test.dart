import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quicksnap/main.dart';
import 'package:quicksnap/screens/home/home_page.dart';

void main() {
  testWidgets('Main App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    //check if there is a Home Page
    expect(find.byType(HomePage), findsOneWidget);
  });
}
