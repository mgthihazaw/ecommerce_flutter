import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBConnection {
  static Future<Database> initDB() async {
    final dbDir = await sql.getDatabasesPath();
    var dbPath = path.join(dbDir, "db-ecommerce");
    var database = sql.openDatabase(dbPath, version: 1,
        onCreate: (db, int version)  {
      return  db.execute(
          "CREATE TABLE carts(id INTEGER PRIMARY KEY, productId INTEGER, productName TEXT, productPhoto TEXT, productPrice INTEGER, productDiscount INTEGER, productQuantity INTEGER)");
    });
    return database;
  }
}
