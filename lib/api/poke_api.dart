import 'dart:convert';
import 'package:pokemon_sample_app/constants/api_constants.dart';
import 'package:pokemon_sample_app/models/pokemon.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon(int id) async {
  final response = await http.get(Uri.parse("$baseUrl/pokemon/$id"));
  if (response.statusCode == 200) {
    return Pokemon.fromJson(json.decode(response.body));
  } else {
    return Pokemon.fromError();
  }
}