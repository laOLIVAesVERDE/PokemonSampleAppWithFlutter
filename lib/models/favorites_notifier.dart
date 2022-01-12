import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/models/favorite.dart';

class FavoritesNotifier extends ChangeNotifier {
  final List<Favorite> _favorites = [];
  List<Favorite> get favorites => _favorites;
}