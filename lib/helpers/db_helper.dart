import 'dart:async';
import 'dart:convert';
import 'package:nongkuy/models/local_restaurant_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  factory DBHelper() {
    _instance._updateFavorites();
    return _instance;
  }

  DBHelper._internal();

  final _controller = StreamController<List<Restaurant>>.broadcast();

  Stream<List<Restaurant>> get favoriteStream => _controller.stream;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'restaurant.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL,
            foods TEXT,
            drinks TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    final db = await database;
    await db.insert(
        'favorites',
        {
          'id': restaurant.id,
          'name': restaurant.name,
          'description': restaurant.description,
          'pictureId': restaurant.pictureId,
          'city': restaurant.city,
          'rating': restaurant.rating,
          'foods': json
              .encode(restaurant.menus?.foods?.map((e) => e.toJson()).toList()),
          'drinks': json.encode(
              restaurant.menus?.drinks?.map((e) => e.toJson()).toList()),
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    _updateFavorites();
  }

  Future<void> deleteFavorite(String id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
    _updateFavorites();
  }

  Future<List<Restaurant>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) {
      return Restaurant(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        pictureId: maps[i]['pictureId'],
        city: maps[i]['city'],
        rating: maps[i]['rating'],
        menus: Menus(
          foods: (json.decode(maps[i]['foods']) as List)
              .map((data) => Drink.fromJson(data))
              .toList(),
          drinks: (json.decode(maps[i]['drinks']) as List)
              .map((data) => Drink.fromJson(data))
              .toList(),
        ),
      );
    });
  }

  void _updateFavorites() async {
    final favorites = await getFavorites();
    _controller.sink.add(favorites);
  }

  void dispose() {
    _controller.close();
  }
}
