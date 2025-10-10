import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService{
  static final DatabaseService instance=DatabaseService._constructor();
  static Database? _database;

  // private constructor to apply singleton pattern
  DatabaseService._constructor();

  // get database instance
  Future<Database> get database async{
    if(_database!=null)return _database!;

    _database=await _initDatabase();
    return _database!;
  }

  // get database connection
  Future<Database> _initDatabase()async{
    final String databasePath=join(
      await getDatabasesPath(),
      'demo.db',
    );

    return await openDatabase(
      databasePath,
      version:1,
      onCreate:_createDatabase,
    );
  }

  // create tables if necessary
  Future<void> _createDatabase(Database database,int version)async{
    await database.execute(
'''
CREATE TABLE User(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(32),
email VARCHAR(100),
password VARCHAR(100)
);
'''
    );
  }

  // close database
  Future<void> close()async{
    final Database database=await instance.database;

    database.close();
  }
}
