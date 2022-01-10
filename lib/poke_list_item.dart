import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/constants/api_constants.dart';
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
                color: (pokeTypeColors[pokemon!.types.first] ?? Colors.grey[100])?.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(pokemon!.imageUrl)
                )
            )
        ),
        title: Text(
          pokemon!.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(pokemon!.types.first),
        trailing: const Icon(Icons.navigate_next),
        onTap: () => {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => PokeDetail(pokemon: pokemon!)
              )
          )
        },
      );
    } else {
      return const ListTile(title: Text('...'));
    }
  }
}
