import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/models/pokemons_notifier.dart';
import 'package:pokemon_sample_app/models/theme_mode_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './utils/theme_mode.dart';
import './settings.dart';
import './poke_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final themeModeNotifier = ThemeModeNotifier(pref);
  final pokemonsNotifier = PokemonsNotifier();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeModeNotifier,
        ),

      ],
      child: const MyApp(),
    )

  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, modeNotifier, child) => MaterialApp(
        title: 'Pokemon Flutter',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: modeNotifier.mode,
        home: const TopPage(),
      ),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentItemIndex == 0 ? const PokeList() : const Settings(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() => currentItemIndex = index)
        },
        currentIndex: currentItemIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings"
          )
        ],
      ),
    );
  }
}
