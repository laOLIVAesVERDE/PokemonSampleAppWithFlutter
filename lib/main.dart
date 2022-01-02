import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/poke_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("detail"),
          onPressed: () => {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => const PokeDetail()
                )
            )
          },
        ),
      ),
    );
  }
}
