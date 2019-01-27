import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import './part_model.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "bikelog.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Parts(id INTEGER  PRIMARY KEY, name TEXT, price TEXT)");
    print("Created tables");
  }

  // Retrieving employees from Employee Tables
  Future<List<Part>> getPart() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Parts');
    List<Part> parts = new List();
    for (int i = 0; i < list.length; i++) {
      parts.add(Part(list[i]["name"], list[i]["price"]));
    }
    print(parts.length);
    return parts;
  }

  void savePart(Part part) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert('INSERT INTO Parts(name, price) VALUES(' +
          '\'' +
          part.name +
          '\'' +
          ',' +
          '\'' +
          part.price +
          '\'' +
          ')');
    });
  }

  void clearDatabase() async {
    var dbClient = await db;
    await dbClient.rawDelete('DELETE FROM Parts');
  }
}
