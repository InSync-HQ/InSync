import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static savePref(String key, value) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static loginPref(String jwt) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
    prefs.setString('jwt', jwt);
  }

  static logoutPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);
  }

  static themeSystemPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', 1);
  }

  static themeLightPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', 2);
  }

  static themeDarkPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', 3);
  }

  static Future<bool?> retrieveAuthPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool('auth');
  }

  static Future<int?> retrievethemePref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('theme');
  }

  static deletePref(String key) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static retrievePref(String key) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static updateUserToken(String token) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
