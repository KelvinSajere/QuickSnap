/*
Entity Class that holds the Business Card Defination 
 */

class BusinessCard {
  String _businessName,
      _clientName,
      _role,
      _phoneNumber,
      _email,
      _webSite,
      _address;

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

  @override
  String toString() {
    final StringBuffer builder = StringBuffer();
    builder.write("{BusinessName:$_businessName}");
    return builder.toString();
  }
}
