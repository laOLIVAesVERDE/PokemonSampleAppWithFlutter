import 'package:pokemon_sample_app/models/pokemon.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon(int id) async {
  final result = await http.get(url)
}