import 'package:flutter/material.dart';
import './utils/theme_mode.dart';
import './settings.dart';
import './poke_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  @override
  void initState() {
    super.initState();
    loadThemeMode().then((value) =>
        setState(() => themeMode = value)
    );
  }
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: const TopPage(),
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
