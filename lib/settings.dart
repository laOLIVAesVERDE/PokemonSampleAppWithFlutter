import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/theme_mode_selection_page.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ThemeModeSelectionPage()
            )),
          },
        )
      ],
    );
  }
}
