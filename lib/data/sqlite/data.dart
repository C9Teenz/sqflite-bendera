import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._privateCons(); // private constructor
  static DatabaseManager instance = DatabaseManager._privateCons();
  static const _databseName = "Barang";

  static const _databseVersion = 1;

  static const tableName = "barang_user";

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnQuantity = 'quantity';
  static const columnHarga = 'harga';
  static const columnSuplayer = 'suplayer';

  Database? _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _databseName);
    _db = await openDatabase(path, version: _databseVersion,
        onCreate: (db, version) async {
      await db.execute("DROP TABLE IF EXISTS $tableName");
      await db.execute('''CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            $columnHarga INTEGER NOT NULL,
            $columnSuplayer TEXT NOT NULL
          )''');
    });
    return _db;
  }

  // Future _onCreate(Database db, int version) async {
  //   return await db.execute('''
  //         CREATE TABLE $tableName (
  //           $columnId INTEGER PRIMARY KEY,
  //           $columnName TEXT NOT NULL,
  //           $columnQuantity INTEGER NOT NULL,
  //           $columnHarga INTEGER NOT NULL,
  //           $columnSuplayer TEXT NOT NULL

  //         )
  //         ''');
}
