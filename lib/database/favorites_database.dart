import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDatabase {
  static Future<Database> open() async {
    return await openDatabase(
      // iOS、Android それぞれに適したファイル置き場のパスを返す
      join(await getDatabasesPath(), "poke_favs.db"),
      // データベースファイルが見つからない時に呼び出される
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1
    );
  }
}