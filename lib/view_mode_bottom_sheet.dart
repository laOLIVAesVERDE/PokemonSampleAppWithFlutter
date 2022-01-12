import 'package:flutter/material.dart';

class ViewModeBottomSheet extends StatelessWidget {
  const ViewModeBottomSheet({Key? key, required this.isFavorite}) : super(key: key);
  final bool isFavorite;

  String mainText(bool isFavorite) {
    return isFavorite ? 'お気に入りのポケモンが表示されています' : 'すべてのポケモンが表示されています';
  }
  String menuTitle(bool isFavorite) {
    return isFavorite ? '「すべて」表示に切り替え' : '「お気に入り」表示に切り替え';
  }
  String menuSubTitle(bool isFavorite) {
    return isFavorite ? '全てのポケモンが表示されます' : 'お気に入りに登録したポケモンのみが表示されます';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                mainText(isFavorite),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
