import 'package:flutter/cupertino.dart';
import 'package:pokemon_sample_app/models/pokemon.dart';

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon> _pokeMap = {};
  Map<int, Pokemon> get pokes => _pokeMap;

  void addPoke(Pokemon pokemon) {
    _pokeMap[pokemon.id] = pokemon;
    notifyListeners();
  }
}