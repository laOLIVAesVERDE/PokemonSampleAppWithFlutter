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
  static const int pageSize = 30;
  var _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
        builder: (context, pokemonsNotifier, child) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            itemCount: _currentPage + 1, // setStateが呼ばれたタイミングでカウントアップ
            itemBuilder: (context, index) {
              if (index == _currentPage) {
                return OutlinedButton(
                    onPressed: () => {
                      setState( () {
                        _currentPage += pageSize;
                        if (_currentPage > pokeMaxId) _currentPage = pokeMaxId;
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

  int itemCount() {
    var count = _currentPage * pageSize;
    if (count > pokeMaxId) {
      count = pokeMaxId;
    }
    return count;
  }
}
