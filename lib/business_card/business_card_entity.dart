import 'package:quicksnap/database/entity.dart';
/*
Entity Class that holds the Business Card Defination 
 */

class BusinessCard extends Entity {
  String _businessName,
      _clientName,
      _role,
      _phoneNumber,
      _email,
      _webSite,
      _address,
      _imageUrl;
  int _id;

  set setBusinessName(String input) => _businessName = input;

  String get getBusinessName => _businessName;

  set setClientName(String input) => _clientName = input;

  get getClientName => _clientName;

  set setRole(String input) => _role = input;

  get getRole => _role;

  set setPhoneNumber(String input) => _phoneNumber = input;

  get getPhoneNumber => _phoneNumber;

  set setEmail(String input) => _email = input;

  String get getEmail => _email;

  set setWebUrl(String input) => _webSite = input;

  String get getWebUrl => _webSite;

  set setAddress(String input) => _address = input;

  String get getAddress => _address;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "business_card_image_url": _imageUrl,
      "business_name": _businessName,
      "client_name": _clientName,
      "role": _role,
      "phone_number": _phoneNumber,
      "email": _email,
      "web_url": _webSite,
      "address": _address
    };
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }
}
