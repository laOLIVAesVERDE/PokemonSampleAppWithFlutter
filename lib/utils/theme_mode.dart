import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTheme = ThemeMode.system;

Future<void> saveThemeMode(ThemeMode mode) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString(mode.key, mode.name);
}

Future<ThemeMode> loadThemeMode() async {
  final pref = await SharedPreferences.getInstance();
  String? modeName = pref.getString(defaultTheme.key);
  return toMode(modeName ?? defaultTheme.name);
}

ThemeMode toMode(String str) {
  return ThemeMode.values.where((value) => value.name == str).first;
}

/// ThemeModeの拡張関数
extension ThemeModeEx on ThemeMode {
  String get key => toString().split('.').first; // ThemeMode
  String get name => toString().split('.').last; // system / dark / light
}