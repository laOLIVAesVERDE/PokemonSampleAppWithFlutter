import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_sample_app/api/poke_api.dart';
import 'package:pokemon_sample_app/models/pokemon.dart';

final pokemonsProvider = StateNotifierProvider<PokemonsNotifier, Map<int, Pokemon?>>((ref) {
  return PokemonsNotifier();
});
class PokemonsNotifier extends StateNotifier<Map<int, Pokemon?>> {
  final Map<int, Pokemon?> _pokeMap = {};
  PokemonsNotifier() : super({});

  void _addPoke(Pokemon pokemon) {
    _pokeMap[pokemon.id] = pokemon;
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) _fetchPoke(id);
    return _pokeMap[id];
  }

  void _fetchPoke(int id) async {
    _pokeMap[id] = null;
    // apiアクセスした結果を引数として渡す
    _addPoke(await fetchPokemon(id));
    state = _pokeMap;
  }
}