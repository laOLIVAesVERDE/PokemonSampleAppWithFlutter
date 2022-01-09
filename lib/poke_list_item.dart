import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/models/pokemon.dart';
import 'package:pokemon_sample_app/poke_detail.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    if (pokemon != null) {
      return ListTile(
        leading: Container(
            width: 80,
            decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                    )
                )
            )
        ),
        title: const Text(
          "pikachu",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('⚡️electric'),
        trailing: const Icon(Icons.navigate_next),
        onTap: () => {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => const PokeDetail()
              )
          )
        },
      );
    } else {
      return const ListTile(title: Text('...'));
    }
  }
}
