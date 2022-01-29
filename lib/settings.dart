import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_sample_app/models/theme_mode_notifier.dart';
import 'package:pokemon_sample_app/theme_mode_selection_page.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          trailing: Text(getModeString(themeMode)),
          onTap: () async {
            // モード選択画面での結果を受け取る
            var ret = await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
                    builder: (context) => ThemeModeSelectionPage(mode: themeMode)
                )
            );
            // trailingテキスト更新
            if (ret != null) {
              ref.read(themeModeProvider.notifier).update(ret);
            }
          },
        )
      ],
    );
  }

  String getModeString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system: return "System";
      case ThemeMode.dark: return "Dark";
      case ThemeMode.light: return "Light";
    }
  }
}
