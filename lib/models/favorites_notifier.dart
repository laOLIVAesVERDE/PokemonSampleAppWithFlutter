import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/database/favorites_database.dart';
import 'package:pokemon_sample_app/models/favorite.dart';

class FavoritesNotifier extends ChangeNotifier {
  final List<Favorite> _favorites = [];
  List<Favorite> get favorites => _favorites;

  FavoritesNotifier() { syncDatabase(); }

  void syncDatabase() async {
    FavoritesDatabase.read().then((value) =>
        _favorites..clear()..addAll(value)
    );
    notifyListeners();
  }

  void toggle(Favorite favorite) {
    isExist(favorite.pokeId) ? _delete(favorite.pokeId) : _add(favorite);
  }

  bool isExist(int pokeId) => (_favorites.indexWhere((it) => it.pokeId == pokeId) < 0) ? false : true;

  void _add(Favorite favorite) async {
    await FavoritesDatabase.create(favorite);
    notifyListeners();
  }

  void _delete(int id) async {
    await FavoritesDatabase.delete(id);
    notifyListeners();
  }
}