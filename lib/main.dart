import 'package:flutter/material.dart';
import './poke_list_item.dart';
import './poke_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            itemCount: 898,
            itemBuilder: (context, index) => PokeListItem(index: index)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {},
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

//
// class TopPage extends StatelessWidget {
//   const TopPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView.builder(
//           padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//           itemCount: 898,
//           itemBuilder: (context, index) => PokeListItem(index: index)
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (index) => {},
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.list),
//               label: "home"
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: "settings"
//           )
//         ],
//       ),
//     );
//   }
// }
