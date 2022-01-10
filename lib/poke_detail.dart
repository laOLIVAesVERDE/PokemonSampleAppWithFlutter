import 'package:flutter/material.dart';

import 'constants/api_constants.dart';
import 'models/pokemon.dart';

class PokeDetail extends StatelessWidget {
  const PokeDetail({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Spacer(),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    pokemon.imageUrl,
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "No.${pokemon.id}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            Text(
              pokemon.name,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // PaddingWidgetのリストを渡す
              children: pokemon.types.map((type) =>
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(
                        backgroundColor: pokeTypeColors[type] ?? Colors.grey,
                        label: Text(
                          type,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _getTextLuminanceBy(type) > 0.5 ? Colors.black : Colors.white,
                          ),
                        ),
                      )
                  )
              ).toList(),
            ),
            const Spacer(),
          ],
        ),
      )
    );
  }

  double _getTextLuminanceBy(String type) {
    return (pokeTypeColors[type] ?? Colors.grey).computeLuminance();
  }
}