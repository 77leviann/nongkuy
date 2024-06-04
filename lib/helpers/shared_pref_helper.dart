import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String keyIsScheduled = 'isScheduled';
  static const String keyThemeMode = 'themeMode';

  static Future<bool> getIsScheduled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsScheduled) ?? false;
  }

  static Future<void> setIsScheduled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsScheduled, value);
  }

  static Future<int> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyThemeMode) ?? ThemeMode.system.index;
  }

  static Future<void> setThemeMode(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(keyThemeMode, value);
  }
}
