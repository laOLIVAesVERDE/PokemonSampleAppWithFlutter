import 'package:flutter/cupertino.dart';
import 'package:pokemon_sample_app/api/poke_api.dart';
import 'package:pokemon_sample_app/models/pokemon.dart';

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon?> _pokeMap = {};

  void _addPoke(Pokemon pokemon) {
    _pokeMap[pokemon.id] = pokemon;
    notifyListeners();
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) _fetchPoke(id);
    return _pokeMap[id];
  }

  void _fetchPoke(int id) async {
    _pokeMap[id] = null;
    // apiアクセスした結果を引数として渡す
    _addPoke(await fetchPokemon(id));
  }
}