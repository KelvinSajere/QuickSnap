// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:quicksnap/business_card/business_card_bloc.dart';

void main() {
  group('Email Validation', () {
    test('Invalid Email', () {
      final businessCardBloc = BusinessCardBloc();

      expect(businessCardBloc.validateEmail("email"),
          "Please enter a valid Email");
    });

    test('Valid Email', () {
      final businessCardBloc = BusinessCardBloc();

      expect(businessCardBloc.validateEmail("email@email.com"), null);
    });
  });

  group('Web Url Validation', () {
    test('Invalid URL', () {
      final businessCardBloc = BusinessCardBloc();

      expect(businessCardBloc.validateWebUrl("email"),
          "Please enter a valid Web Url");
    });

    test('Valid URL', () {
      final businessCardBloc = BusinessCardBloc();

      expect(businessCardBloc.validateWebUrl("gmail.com"), null);
    });
  });
}
