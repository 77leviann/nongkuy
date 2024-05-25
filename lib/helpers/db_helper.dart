import 'package:nongkuy/models/get_restaurant_list_response_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static final DBHelper db = DBHelper._();
  DBHelper._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    String path = join(
      await getDatabasesPath(),
      'restaurant.db',
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: (
        db,
        version,
      ) async {
        await db.execute('''
          CREATE TABLE favorites (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL
          )
        ''');
      },
    );
  }

  Future<void> insertFavorite(
    Restaurant restaurant,
  ) async {
    final db = await database;
    await db!.insert(
      'favorites',
      restaurant.toJson(),
    );
  }

  Future<void> deleteFavorite(
    String id,
  ) async {
    final db = await database;
    await db!.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Restaurant>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'favorites',
    );
    return List.generate(maps.length, (
      i,
    ) {
      return Restaurant.fromJson(
        maps[i],
      );
    });
  }

  Future<bool> isFavorite(
    String id,
  ) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}
