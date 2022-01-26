import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_sample_app/database/favorites_database.dart';
import 'package:pokemon_sample_app/models/favorite.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Favorite>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<Favorite>> {
  final List<Favorite> _favorites = [];
  List<Favorite> get favorites => _favorites;

  FavoritesNotifier() : super([]) {
    syncDatabase();
  }

  void syncDatabase() async {
    state = await FavoritesDatabase.read();
  }

  void toggle(Favorite favorite) async {
    isExist(favorite.pokeId) ? _delete(favorite.pokeId) : _add(favorite);
    state = await FavoritesDatabase.read();
  }

  bool isExist(int pokeId) => (state.indexWhere((it) => it.pokeId == pokeId) < 0) ? false : true;

  void _add(Favorite favorite) async {
    await FavoritesDatabase.create(favorite);
    state = await FavoritesDatabase.read();
  }

  void _delete(int id) async {
    await FavoritesDatabase.delete(id);
    state = await FavoritesDatabase.read();
  }
}