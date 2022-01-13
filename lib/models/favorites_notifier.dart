import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/models/favorite.dart';

class FavoritesNotifier extends ChangeNotifier {
  final List<Favorite> _favorites = [];
  List<Favorite> get favorites => _favorites;

  void toggle(Favorite favorite) {
    isExist(favorite.pokeId) ? _delete(favorite) : _add(favorite);
  }

  bool isExist(int pokeId) => (_favorites.indexWhere((it) => it.pokeId == pokeId) >= 0) ? true : false;

  void _add(Favorite favorite) {
    _favorites.add(favorite);
    notifyListeners();
  }

  void _delete(Favorite favorite) {
    final result = _favorites.remove(favorite);
    if (result) notifyListeners();
  }
}