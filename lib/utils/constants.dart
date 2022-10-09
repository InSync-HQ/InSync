import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static savePref(String key, value) async {
    final prefs = GetStorage();
    prefs.write(key, value);
  }

  static loginPref(String jwt) async {
    final auth = GetStorage();
    auth.write('auth', true);
    auth.write('jwt', jwt);
  }

  static logoutPref() async {
    final auth = GetStorage();
    auth.write('auth', false);
  }

  static themeSystemPref() async {
    final theme = GetStorage();
    theme.write('theme', 1);
  }

  static themeLightPref() async {
    final theme = GetStorage();
    theme.write('theme', 2);
  }

  static themeDarkPref() async {
    final theme = GetStorage();
    theme.write('theme', 3);
  }

  static Future<bool?> retrieveAuthPref() async {
    final auth = GetStorage();
    return auth.read('auth');
  }

  static Future<int?> retrievethemePref() async {
    final theme = GetStorage();
    return theme.read('theme');
  }

  static deletePref(String key) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static retrievePref(String key) async {
    final prefs = GetStorage();
    prefs.remove(key);
  }

  static updateUserToken(String token) async {
    final userToken = GetStorage();
    userToken.write('token', token);
  }
}
