import 'package:flutter/material.dart';
import '../utils/theme_mode.dart';

class ThemeModeNotifier extends ChangeNotifier {
  late ThemeMode _themeMode;
  ThemeMode get mode => _themeMode;
  ThemeModeNotifier() {

  }
}