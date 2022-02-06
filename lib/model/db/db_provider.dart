import 'dart:developer';
import 'dart:io';

import 'package:fchat/model/db/migrations.dart';
import 'package:sqflite/sqflite.dart';
import 'migrations.dart';

class DBProvider {
  static const String DB_NAME = "TestDB.db";
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = (await getDatabasesPath()) + DB_NAME;

    await deleteDatabase(path);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onConfigure: (Database db) async {
      await db.execute('PRAGMA foreign_keys=ON');
    }, onCreate: (Database db, int version) async {
      log("db version: $version");
      for (int key in migrations.keys) {
        if (key >= version) {
          await db.execute(migrations[key]!);
          await db.setVersion(key);
        }
      }
    });
  }

  closeDB() async {
    final db = await database;
    await db!.close();
  }

  openDB() async {
    String path = (await getDatabasesPath()) + DB_NAME;
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onConfigure: (Database db) async {
        await db.execute('PRAGMA foreign_keys=ON');
      },
    );
  }
}
