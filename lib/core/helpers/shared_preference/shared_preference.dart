



import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late final SharedPreferences _sharedPref;
  static Future <void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  static void setValue(String key, {required dynamic value}) async {
    if (value is String) {
      await _sharedPref.setString(key, value);
    }

    if (value is bool) {
      await _sharedPref.setBool(key, value);
    }

    if (value is int) {
      await _sharedPref.setInt(key, value);
    }

    if (value is double) {
      await _sharedPref.setDouble(key, value);
    }
  }

  static Object? getValue(String key) {
    return _sharedPref.get(key);
  }

  static void removeValue (String key) {
      _sharedPref.remove(key);
  }
}