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
                // pop時に選択されたテーマを渡す
                onPressed: () => Navigator.pop<ThemeMode>(context, _currentMode),
              ),
            ),
            /**
             * ラジオボタンは、valueとgroupValueが一致した時に選択状態となる
             */
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _currentMode,
              title: const Text("System"),
              onChanged: (value) => {
                setState(() => _currentMode = value!)
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _currentMode,
              title: const Text("Dark"),
              onChanged: (value) => {
                setState(() => _currentMode = value!)
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _currentMode,
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
