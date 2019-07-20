import 'package:flutter/widgets.dart';
import 'package:quicksnap/models/abstract_entity/entity.dart';
/*
Entity Class that holds the Business Card Defination 
 */

class BusinessCard extends AbstractEntity {
  String _businessName,
      _clientName,
      _role,
      _phoneNumber,
      _email,
      _webSite,
      _address,
      _imageUrl;
  int _id;

  BusinessCard();
  BusinessCard.withValues(
      {@required String businessName,
      @required String clientName,
      @required String role,
      @required String phoneNumber,
      String email,
      String webSite,
      @required String address,
      @required String imageUrl,
      int id})
      : _businessName = businessName,
        _clientName = clientName,
        _role = role,
        _phoneNumber = phoneNumber,
        _email = email,
        _webSite = webSite,
        _address = address,
        _imageUrl = imageUrl,
        _id = id;

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

  set setImageUrl(String imageUrl) => _imageUrl = imageUrl;

  String get getImageUrl => _imageUrl;

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

  @override
  BusinessCard fromMap(Map<String, dynamic> map) {
    return BusinessCard.withValues(
        businessName: map["business_name"],
        clientName: map["client_name"],
        address: map["address"],
        imageUrl: map["business_card_image_url"],
        phoneNumber: map["phone_number"],
        role: map["role"],
        email: map["email"],
        webSite: map["web_url"]);
  }

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.writeln("business_card_image_url $_imageUrl");
    buffer.writeln("business_name $_businessName");
    buffer.writeln("client_name $_clientName");
    buffer.writeln("role $_role");
    buffer.writeln("phone_number $_phoneNumber");
    buffer.writeln("email $_email");
    buffer.writeln("web_url $_webSite");
    buffer.writeln("address $_address");
    buffer.writeln("ID $_id");
    return buffer.toString();
  }
}
