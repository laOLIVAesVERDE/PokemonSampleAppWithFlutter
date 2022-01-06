import 'package:flutter/material.dart';
import '../utils/theme_mode.dart';

class ThemeModeNotifier extends ChangeNotifier {
  late ThemeMode _themeMode;
  ThemeMode get mode => _themeMode;
  ThemeModeNotifier() {

  }
  void _init() async {
    _themeMode = await loadThemeMode();
    notifyListeners()
  }
}