import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class TodoDatabaseService{
  TodoDatabaseService._();
  static TodoDatabaseService singleton = TodoDatabaseService._();
  Database? _database;
  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase()async{
    return await openDatabase(
      join(await getDatabasesPath(), 'todos_with_category.db'),
      
    );
  }
}