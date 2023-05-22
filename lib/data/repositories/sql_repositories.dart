import 'package:sqflite/sqflite.dart';

import '../model/barang_model.dart';
import '../sqlite/data.dart';

class SQLRepositories {
  final tableName = "barang_user";

  final columnId = '_id';
  final columnName = 'name';
  final columnQuantity = 'quantity';
  DatabaseManager database = DatabaseManager.instance;
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database.db;
    return await db.insert(tableName, row);
  }

  Future<List<BarangModel>> queryAllRows() async {
    Database db = await database.db;
    final List<Map<String, dynamic>> result = await db.query(tableName);

    return result.map((e) => BarangModel.fromJson(e)).toList();
  }

  Future<int> queryRowCount() async {
    Database db = await database.db;
    final result = await db.rawQuery('SELECT COUNT(*) FROM $tableName');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database.db;
    final id = row[columnId];
    return await db
        .update(tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> delete(int? id) async {
    Database db = await database.db;
    if (id != null) {
      await db.delete(tableName, where: '_id=$id');
    } else {
      throw Exception();
    }
  }

  Future<BarangModel> getOneCell(int id) async {
    Database db = await database.db;
    final result = await db.query(tableName, where: '_id=$id');
    return BarangModel.fromJson(result.first);
  }
  void deleteTable(){
    database.db.then((value) => value.delete(tableName));
  }
}
