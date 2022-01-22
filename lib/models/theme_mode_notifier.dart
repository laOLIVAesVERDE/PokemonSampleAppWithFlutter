import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme_mode.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  late ThemeMode _themeMode;
  ThemeMode get mode => _themeMode;
  ThemeModeNotifier() : super(ThemeMode.system) {
    _init();
  }

  void _init() async {
    final pref = await SharedPreferences.getInstance();
    state = await loadThemeMode(pref);
  }

  void update(ThemeMode nextMode) {
    _themeMode = nextMode;
    saveThemeMode(nextMode);
    state = nextMode;
  }
}