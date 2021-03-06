import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_sample_app/constants/api_constants.dart';
import 'package:pokemon_sample_app/models/favorite.dart';
import 'package:pokemon_sample_app/models/favorites_notifier.dart';
import 'package:pokemon_sample_app/models/pokemons_notifier.dart';
import 'package:pokemon_sample_app/view_mode_bottom_sheet.dart';
import './poke_list_item.dart';

class PokeList extends StatefulHookConsumerWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PokeListState();
  }
}

class _PokeListState extends ConsumerState<PokeList> {
  static const int pageSize = 30;
  var _currentPage = 1;
  bool _isFavoriteMode = false;
  List<Favorite> favMock = [
    Favorite(pokeId: 1),
    Favorite(pokeId: 4),
    Favorite(pokeId: 7),
  ];
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesProvider);
    final pokemonsNotifier = ref.read(pokemonsProvider.notifier);
    return Column(
        children: [
          Container(
            height: 24,
            alignment: Alignment.topRight,
            child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.auto_awesome_outlined),
                onPressed: () async {
                  final result = await showModalBottomSheet<bool>(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)
                        )
                      ),
                      builder: (BuildContext context) {
                        return ViewModeBottomSheet(isFavorite: _isFavoriteMode);
                      }
                  );
                  if (result == true) changeMode(_isFavoriteMode);
                }
            ),
          ),
          Expanded(
            child: (itemCount(favorites.length, _currentPage, _isFavoriteMode)) == 0
                ? const Text("no data")
                : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                // setState?????????????????????????????????????????????????????????
                itemCount: itemCount(favorites.length, _currentPage, _isFavoriteMode) + 1,
                itemBuilder: (context, index) {
                  if (index == itemCount(favorites.length, _currentPage, _isFavoriteMode)) {
                    return OutlinedButton(
                      // ?????????????????????????????????????????????
                        onPressed: isLastPage(_currentPage) ? null : () => {
                          setState( () => _currentPage++ )
                        },
                        child: const Text("more")
                    );
                  } else {
                    return PokeListItem(
                        pokemon: pokemonsNotifier.byId(itemId(favorites, index))
                    );
                  }
                })
            ),
        ],
      );
  }

  void changeMode(bool isFavoriteMode) {
    setState(() => _isFavoriteMode = !isFavoriteMode);
  }

  int itemCount(int favCount, int page, bool isFavoriteMode) {
    var count = page * pageSize;
    if (isFavoriteMode && count > favMock.length) {
      count = favCount;
    }
    if (count > pokeMaxId) {
      count = pokeMaxId;
    }
    return count;
  }
  
  int itemId(List<Favorite> favorites, int index) {
    int id = index + 1;
    if (_isFavoriteMode && index < favorites.length) {
      id = favorites[index].pokeId;
    }
    return id;
  }

  bool isLastPage(int page) {
    if (_isFavoriteMode) {
      return (page * pageSize < favMock.length) ? false : true;
    } else {
      return (page * pageSize < pokeMaxId) ? false : true;
    }
  }
}
