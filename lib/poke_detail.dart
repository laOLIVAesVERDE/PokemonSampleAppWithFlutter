import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_sample_app/models/favorites_notifier.dart';
import 'constants/api_constants.dart';
import 'models/favorite.dart';
import 'models/pokemon.dart';

class PokeDetail extends HookConsumerWidget {
  final Pokemon pokemon;
  const PokeDetail({Key? key, required this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watchすることでisExistが動くようになる
    final favorites = ref.watch(favoritesProvider);
    final favoritesNotifier = ref.read(favoritesProvider.notifier);
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                trailing: IconButton(
                  icon: favoritesNotifier.isExist(pokemon.id)
                      ? const Icon(Icons.star, color: Colors.orangeAccent)
                      : const Icon(Icons.star_outline),
                  onPressed: () async {
                    favoritesNotifier.toggle(Favorite(pokeId: pokemon.id));
                  }
                )
              ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    child: Image.network(
                      pokemon.imageUrl,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "No.${pokemon.id}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
              Text(
                pokemon.name,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // PaddingWidgetのリストを渡す
                children: pokemon.types.map((type) =>
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Chip(
                          backgroundColor: pokeTypeColors[type] ?? Colors.grey,
                          label: Text(
                            type,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _getTextLuminanceBy(type) > 0.5 ? Colors.black : Colors.white,
                            ),
                          ),
                        )
                    )
                ).toList(),
              ),
              const Spacer(),
            ],
          ),
        )
      );
  }

  double _getTextLuminanceBy(String type) => (pokeTypeColors[type] ?? Colors.grey).computeLuminance();
}