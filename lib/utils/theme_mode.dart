import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTheme = ThemeMode.system;

Future<void> saveThemeMode(ThemeMode mode) async {

}

/// ThemeModeの拡張関数
extension ThemeModeEx on ThemeMode {
  String get key => toString().split('.').first;
  String get name => toString().split('.').last;
}