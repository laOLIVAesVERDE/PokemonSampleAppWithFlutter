import 'package:flutter/material.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({
    Key? key,
    required this.mode
  }) : super(key: key);
  final ThemeMode mode;

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  late ThemeMode _currentMode;
  @override
  void initState() {
    super.initState();
    _currentMode = widget.mode;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, _currentMode),
              ),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: ThemeMode.system,
              title: const Text("System"),
              onChanged: (value) => {
                setState(() => _currentMode = value!)
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: ThemeMode.system,
              title: const Text("Dark"),
              onChanged: (value) => {
                setState(() => _currentMode = value!)
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: ThemeMode.system,
              title: const Text("Light"),
              onChanged: (value) => {
                setState(() => _currentMode = value!)
              },
            ),
          ],
        ),
      ),
    );
  }
}
