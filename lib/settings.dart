import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/theme_mode_selection_page.dart';
import './utils/theme_mode.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  void initState() {
    super.initState();
    loadThemeMode().then((value) =>
        setState(() => _themeMode = value)
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          trailing: Text(getModeString()),
          onTap: () async {
            // モード選択画面での結果を受け取る
            var ret = await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
                    builder: (context) => ThemeModeSelectionPage(mode: _themeMode)
                )
            );
            // trailingテキスト更新
            setState(() => _themeMode = ret!);
            await saveThemeMode(_themeMode);
          },
        )
      ],
    );
  }

  String getModeString() {
    switch (_themeMode) {
      case ThemeMode.system: return "System";
      case ThemeMode.dark: return "Dark";
      case ThemeMode.light: return "Light";
    }
  }
}
