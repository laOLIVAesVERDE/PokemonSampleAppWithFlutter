import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/models/pokemons_notifier.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';

class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
        builder: (context, pokemonsNotifier, child) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            itemCount: 10,
            itemBuilder: (context, index) {
              return PokeListItem(
                pokemon: pokemonsNotifier.byId(index + 1)
              );
            }
        )
    );
  }
}
