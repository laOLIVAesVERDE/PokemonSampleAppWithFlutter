import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/poke_detail.dart';

void main() {
  runApp(const TopPage());
}

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokeDetail(),
    );
  }
}