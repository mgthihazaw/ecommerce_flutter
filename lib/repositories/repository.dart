

import 'package:ecommerce/repositories/db-connection.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart' as sql;
class Repository{
  final String baseUrl = "http://192.168.10.26:8000/api";

  Future get(String api) async{
    // try{
      print("NET");
      return http.get(baseUrl+api);
    // }on SocketException{
    //   print("Network Error");
    // }
    // print("FF");
  }

 Future getLocal(String table) async {
    var db = await DBConnection.initDB();
    return await db.query(table);
 }

  Future saveLocal(String table,Map data) async{

    var db = await DBConnection.initDB();
    // await db.rawQuery('DELETE  FROM $table');
    
    return await db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);


  }
  updateLocal(table, columnName, data) async {
    var conn = await DBConnection.initDB();
    return await conn.update(table, data, where: '$columnName =?', whereArgs: [data['productId']]);
  }

  getLocalByCondition(table, columnName, conditionalValue) async {
    var conn = await DBConnection.initDB();
    return await conn.rawQuery('SELECT * FROM $table WHERE $columnName=?', ['$conditionalValue']);
  }
  countLocal(table) async{
    
    var conn = await DBConnection.initDB();
   var  data= await conn.rawQuery('SELECT COUNT(*) FROM $table');
   print(data[0]["COUNT(*)"]);
   return data[0]["COUNT(*)"];
  }
  removeLocalById(table,id) async{
    var conn = await DBConnection.initDB();
    return await conn.rawDelete("DELETE FROM $table WHERE productId = $id");
  }
  
}