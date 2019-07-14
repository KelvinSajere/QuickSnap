/*
 *Business Card Bloc  containing all business logic relating to business card
 *Validation business card information
 *Saving business card information
 *Making API call 
 */
class BusinessCardBloc {
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

  String validateRequiredInput(String input, String name) {
    return input.isNotEmpty ? null : "Please enter a $name";
  }
}
