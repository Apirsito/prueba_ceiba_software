import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _userListInString = "";

  static String get userListInString {
    return _prefs.getString("userListInString") ?? _userListInString;
  }

  static set userListInString(String userListInString) {
    _userListInString = userListInString;
    _prefs.setString("userListInString", _userListInString);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
