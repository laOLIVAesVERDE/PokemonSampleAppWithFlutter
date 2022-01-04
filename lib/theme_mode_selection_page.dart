import 'package:flutter/material.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({Key? key}) : super(key: key);

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  ThemeMode _currentMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: ThemeMode.system,
              title: const Text("System"),
              onChanged: (value) => {},
            ),
          ],
        ),
      ),
    );
  }
}
