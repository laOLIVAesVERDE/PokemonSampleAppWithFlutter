import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/models/theme_mode_notifier.dart';
import 'package:pokemon_sample_app/theme_mode_selection_page.dart';
import 'package:provider/provider.dart';
import './utils/theme_mode.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(builder: (context, modeNotifier, child) => ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          trailing: Text(getModeString(modeNotifier.mode)),
          onTap: () async {
            // モード選択画面での結果を受け取る
            var ret = await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
                    builder: (context) => ThemeModeSelectionPage(mode: modeNotifier.mode)
                )
            );
            // trailingテキスト更新
            if (ret != null) {
              modeNotifier.update(ret);
            }
          },
        )
      ],
    ));
  }

  String getModeString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system: return "System";
      case ThemeMode.dark: return "Dark";
      case ThemeMode.light: return "Light";
    }
  }
}
