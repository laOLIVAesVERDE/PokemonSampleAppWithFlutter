import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDatabase {
  static Future<Database> open() async {
    return await openDatabase(
      join(await getDatabasesPath(), "poke_favs.db"),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1
    );
  }
}