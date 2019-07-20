import 'package:quicksnap/database/repository.dart';
import 'package:quicksnap/database/tables.dart';

import 'business_card_entity.dart';

/*
 *Business Card Bloc  containing all business logic relating to business card
 *Validation business card information
 *Saving business card information
 *Making API call 
 */
class BusinessCardBloc {
  final Repository<BusinessCard> repo =
      Repository(entity: BusinessCard(), tableName: TABLES.BUSINESS_CARD);
  final String tableName = TABLES.BUSINESS_CARD;

  String validateEmail(String email) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    if (email.isNotEmpty) {
      return regex.hasMatch(email) ? null : "Please enter a valid Email";
    }
    return null;
  }

  String validateWebUrl(String webUrl) {
    final RegExp regex =
        new RegExp(r"(?:\s*\w+\s*\.\s*)+\w{2,3}\s*(?=\/|\?|\b)");
    if (webUrl.isNotEmpty) {
      return regex.hasMatch(webUrl) ? null : "Please enter a valid Web Url";
    }
    return null;
  }

  String validateRequiredInput(String input, String name) =>
      input.isNotEmpty ? null : "Please enter a $name";

  Future<int> saveNewBusinessCard(BusinessCard entity) async {
    final result = await repo.create(entity);
    print("This is the result of the save:::$result");
    return result;
  }

  Future<List<BusinessCard>> retrieveBusinessCards() async {
    final result = await repo.retrieve();
    return result;
  }
}
