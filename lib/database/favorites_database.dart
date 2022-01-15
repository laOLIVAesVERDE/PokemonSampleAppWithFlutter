import 'package:path/path.dart';
import 'package:pokemon_sample_app/constants/database_constants.dart';
import 'package:pokemon_sample_app/models/favorite.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDatabase {
  static Future<Database> open() async {
    return await openDatabase(
      // iOS、Android それぞれに適したファイル置き場のパスを返す
      join(await getDatabasesPath(), favoritesFileName),
      // データベースファイルが見つからない時に呼び出される
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $favoritesTableName(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1
    );
  }

  static Future<void> create(Favorite favorite) async {
    final db = await open();
    await db.insert(
      favoritesTableName,
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
}