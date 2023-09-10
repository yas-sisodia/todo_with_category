import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo_model.dart';

// Singleton
class TodoDatabase {
  TodoDatabase._();
  static TodoDatabase singleton = TodoDatabase._();
  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'todos.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,  description TEXT, imageUrl TEXT)',
        );
      },
      version: 2,
    );
  }

  Future<void> insertTask(TodoModel todoModel)async{
    final db = await database;
    await db.rawInsert(
        'INSERT INTO tasks(title, description, imageUrl) VALUES( "${todoModel.title}", "${todoModel.description}", "${todoModel.imageUrl}")');
    // await db.insert(
    //   'tasks',
   // //   todoModel.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
    print("Data Added Successfully");
  }

  // count = Sqflite
  //   .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
  Future<List<TodoModel>> getData() async {
    final db = await database;
    return (await db.rawQuery('SELECT * FROM tasks'))
        .map((e) => TodoModel.fromMap(e))
        .toList();
  }
}
