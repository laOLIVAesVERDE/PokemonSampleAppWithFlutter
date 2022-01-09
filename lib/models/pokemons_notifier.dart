import 'package:flutter/cupertino.dart';
import 'package:pokemon_sample_app/api/poke_api.dart';
import 'package:pokemon_sample_app/models/pokemon.dart';

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon?> _pokeMap = {};
  Map<int, Pokemon?> get pokes => _pokeMap;

  void addPoke(Pokemon pokemon) {
    _pokeMap[pokemon.id] = pokemon;
    notifyListeners();
  }

  Pokemon? byId(int id) {
    if (_pokeMap.containsKey(id)) {
      fetchPoke(id);
    }
    return _pokeMap[id];
  }

  void fetchPoke(int id) async {
    _pokeMap[id] = null;
    // apiアクセス
    addPoke(await fetchPokemon(id));
  }
}