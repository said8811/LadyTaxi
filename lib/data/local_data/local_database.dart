import 'package:flutter/material.dart';
import 'package:lady_taxi/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static String tableName = "countries";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("countries.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";

        await db.execute('''
        CREATE TABLE $tableName (
          ${UserField.id} $idType,
          ${UserField.fish} $textType,
          ${UserField.date} $textType,
          ${UserField.number} $textType,
          ${UserField.imgUrl} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<UserModel> insertUser({required UserModel userModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, userModel.toJson());
    debugPrint("ADD BOLDI HAMMASI YAXSHI");
    return userModel.copywith(id: id);
  }

  static Future<List<UserModel>> getCachedUser() async {
    var database = await getInstance.getDb();
    var listCountries = await database.query(
      tableName,
      columns: [
        UserField.id,
        UserField.fish,
        UserField.date,
        UserField.number,
      ],
    );
    var list = listCountries.map((e) => UserModel.fromJson(e)).toList();

    return list;
  }
}
