import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/theme_mode_selection_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          onTap: () async {
            final ret = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ThemeModeSelectionPage()
            ));
          },
        )
      ],
    );
  }
}
