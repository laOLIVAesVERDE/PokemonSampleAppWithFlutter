import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/constants/api_constants.dart';
import 'package:pokemon_sample_app/models/pokemons_notifier.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int more = 30;
  var pokeCount = more;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
        builder: (context, pokemonsNotifier, child) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            itemCount: pokeCount + 1, // setStateが呼ばれたタイミングでカウントアップ
            itemBuilder: (context, index) {
              if (index == pokeCount) {
                return OutlinedButton(
                    onPressed: () => {
                      setState( () {
                        pokeCount += more;
                        if (pokeCount > pokeMaxId) pokeCount = pokeMaxId;
                      })
                    },
                    child: const Text("more")
                );
              } else {
                return PokeListItem(
                    pokemon: pokemonsNotifier.byId(index + 1)
                );
              }
            }
        )
    );
  }
}
