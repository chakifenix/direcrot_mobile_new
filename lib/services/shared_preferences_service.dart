import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kCounterKey = 'counter';
const String _kThemeColorKey = 'theme_color';
const String _kPinCode = 'pin';
const String _loginPassed = 'login';
const String _onboardPassed = 'onboard';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Persist and retrieve counter value
  int get counterValue => _getData(_kCounterKey) ?? 0;
  set counterValue(int value) => _saveData(_kCounterKey, value);

  // Persist and retrieve theme color
  Color get themeColor => Color(_getData(_kThemeColorKey) ?? Colors.blue.value);
  set themeColor(Color value) => _saveData(_kThemeColorKey, value.value);

  String get pinCode => _getData(_kPinCode) ?? '';
  set pinCode(String value) => _saveData(_kPinCode, value);

  bool get passed => _getData(_loginPassed) ?? false;
  set passed(bool value) => _saveData(_loginPassed, value);

  bool get onBoardPassed => _getData(_onboardPassed) ?? false;
  set onBoardPassed(bool value) => _saveData(_onboardPassed, value);

  dynamic _getData(String key) {
    // Retrieve data from shared preferences
    var value = _preferences.get(key);

    // Easily log the data that we retrieve from shared preferences
    debugPrint('Retrieved $key: $value');

    // Return the data that we retrieve from shared preferences
    return value;
  }

  void _saveData(String key, dynamic value) {
    // Easily log the data that we save to shared preferences
    debugPrint('Saving $key: $value');

    // Save data to shared preferences
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }
}
