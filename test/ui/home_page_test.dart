import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:quicksnap/blocs/business_card_bloc.dart';
import 'package:quicksnap/models/business_card_entity.dart';
import 'package:quicksnap/screens/home/home_page.dart';
import 'package:quicksnap/screens/home/widgets/all_business_card.dart';

class HomePageMock extends Mock implements BusinessCardBloc {}

void main() {
  final _bloc = HomePageMock();
  Widget _homePage = MaterialApp(
    home: ChangeNotifierProvider<BusinessCardBloc>(
      builder: (BuildContext context) => _bloc,
      child: HomePage(),
    ),
  );

  group("Home Page ", () {
    when(_bloc.retrieveBusinessCards())
        .thenAnswer((_) => Future<List<BusinessCard>>.value(<BusinessCard>[]));
    testWidgets('UI', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(_homePage);

      //check if Home Page contains title
      expect(
          find.descendant(of: find.byType(AppBar), matching: find.text('Home')),
          findsOneWidget);
      //check the floating button
      expect(find.widgetWithIcon(FloatingActionButton, Icons.contact_mail),
          findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('Behaviour', (WidgetTester tester) async {
      // Build our app and trigger a frame.

      await tester.pumpWidget(_homePage);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      expect(
          find.descendant(
              of: find.byType(AlertDialog),
              matching: find.byType(GestureDetector)),
          findsNWidgets(2));
      expect(
          find.descendant(
              of: find.byType(AlertDialog),
              matching: find.text('Take a picture')),
          findsOneWidget);
      expect(
          find.descendant(
              of: find.byType(AlertDialog),
              matching: find.text('Select from gallery')),
          findsOneWidget);
      verify(_bloc.retrieveBusinessCards());
      expect(find.byType(AllBusinessCard), findsOneWidget);
    });
  });
}
