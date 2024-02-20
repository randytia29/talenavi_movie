import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblMovie = 'movie';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblMovie (
        id INTEGER PRIMARY KEY,
        title TEXT,
        director TEXT,
        summary TEXT,
        genres TEXT
      );
    ''');
  }

  Future<int> insertMovie(MovieModel movie) async {
    final db = await database;

    if (db == null) {
      return 0;
    }

    return await db.insert(_tblMovie, movie.toJson());
  }

  Future<int> removeMovie(int id) async {
    final db = await database;

    if (db == null) {
      return 0;
    }
    return await db.delete(_tblMovie, where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblMovie,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getMovies() async {
    final db = await database;

    if (db == null) {
      return [];
    }

    return await db.query(_tblMovie);
  }
}
