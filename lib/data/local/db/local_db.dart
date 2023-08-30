import 'package:bloc_pratice/data/model/user_model_fields.dart';
import 'package:bloc_pratice/data/model/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("contacts.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${UserModelFields.contactsTable} (
    ${UserModelFields.id} $idType,
    ${UserModelFields.firstname} $textType,
    ${UserModelFields.lastname} $textType,
    ${UserModelFields.jobTitle} $textType,
    ${UserModelFields.age} $intType,
    ${UserModelFields.gender} $intType,
    ${UserModelFields.userId} $intType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<UserModel> insertUser(
      UserModel userModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        UserModelFields.contactsTable, userModel.toJson());
    return userModel.copyWith(id: id);
  }

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(UserModelFields.contactsTable))
        .map((e) => UserModel.fromJson(e))
        .toList();

    return allToDos;
  }

  static updateContact({required UserModel updatedUser}) async {
    final db = await getInstance.database;
    db.update(
      UserModelFields.contactsTable,
      updatedUser.toJson(),
      where: "${UserModelFields.id} = ?",
      whereArgs: [updatedUser.id],
    );
  }

  static Future<int> deleteContact(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      UserModelFields.contactsTable,
      where: "${UserModelFields.userId} = ?",
      whereArgs: [id],
    );
    return count;
  }
}