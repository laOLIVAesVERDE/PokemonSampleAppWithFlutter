import 'package:flutter/material.dart';
import 'package:pokemon_sample_app/constants/api_constants.dart';
import 'package:pokemon_sample_app/models/favorite.dart';
import 'package:pokemon_sample_app/models/favorites_notifier.dart';
import 'package:pokemon_sample_app/models/pokemons_notifier.dart';
import 'package:pokemon_sample_app/view_mode_bottom_sheet.dart';
import 'package:provider/provider.dart';
import './poke_list_item.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
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
    return Consumer<FavoritesNotifier>(
      builder: (context, favoritesNotifier, child) => Column(
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
            child: Consumer<PokemonsNotifier>(
                builder: (context, pokemonsNotifier, child) {
                   if (itemCount(favoritesNotifier.favorites.length, _currentPage, _isFavoriteMode) == 0) {
                    return const Text("no data");
                  } else {
                    return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        itemCount: itemCount(favoritesNotifier.favorites.length, _currentPage, _isFavoriteMode) + 1, // setStateが呼ばれたタイミングでカウントアップ
                        itemBuilder: (context, index) {
                          if (index == itemCount(favoritesNotifier.favorites.length, _currentPage, _isFavoriteMode)) {
                            return OutlinedButton(
                              // 最終ページだったら反応させない
                                onPressed: isLastPage(_currentPage) ? null : () => {
                                  setState( () => _currentPage++ )
                                },
                                child: const Text("more")
                            );
                          } else {
                            return PokeListItem(
                                pokemon: pokemonsNotifier.byId(itemId(index))
                            );
                          }
                        }
                    );
                  }
                }
            ),
          ),
        ],
      ),
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
  
  int itemId(int index) {
    int id = index + 1;
    if (_isFavoriteMode) {
      id = favMock[index].pokeId;
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
