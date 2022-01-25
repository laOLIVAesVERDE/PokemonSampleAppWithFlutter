import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_sample_app/models/favorites_notifier.dart';
import 'package:pokemon_sample_app/models/pokemons_notifier.dart';
import 'package:pokemon_sample_app/models/theme_mode_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './utils/theme_mode.dart';
import './settings.dart';
import './poke_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final SharedPreferences pref = await SharedPreferences.getInstance();
  // final themeModeNotifier = ThemeModeNotifier(pref);
  // final pokemonsNotifier = PokemonsNotifier();
  // final favoritesNotifier = FavoritesNotifier();
  runApp(
    const ProviderScope(
      // providers: [
      //   ChangeNotifierProvider(
      //       create: (context) => pokemonsNotifier
      //   ),
      //   ChangeNotifierProvider(
      //       create: (context) => favoritesNotifier
      //   )
      // ],
      child: MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
        title: 'Pokemon Flutter',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        home: const TopPage()
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeModeNotifier>(
//       builder: (context, modeNotifier, child) => MaterialApp(
//         title: 'Pokemon Flutter',
//         theme: ThemeData.light(),
//         darkTheme: ThemeData.dark(),
//         themeMode: modeNotifier.mode,
//         home: const TopPage(),
//       ),
//     );
//   }
// }

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
        child: IndexedStack(
          children: const [PokeList(), Settings()],
          index: currentItemIndex,
        ),
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
