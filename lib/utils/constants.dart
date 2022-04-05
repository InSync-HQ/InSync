import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static savePref(String key, value) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static loginPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
  }

  static logoutPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);
  }

  static Future<bool?> retrieveAuthPref() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    print(prefs.getBool('auth'));
    return prefs.getBool('auth');
  }

  static deletePref(String key) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
