// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoDatabaseService {
  TodoDatabaseService._();
  static TodoDatabaseService singleton = TodoDatabaseService._();
  Database? _database;
  List<Map<String, Object?>> retrievalQuery = [];
  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'todos_with_category.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE category(id INTEGER  PRIMARY KEY AUTOINCREMENT , title TEXT,  imageUrl TEXT)',
        );
        db.execute(
            'CREATE TABLE tasks(id INTEGER  PRIMARY KEY AUTOINCREMENT , title TEXT,  description TEXT, category_id INTEGER, FOREIGN KEY (category_id) REFERENCES category(id))');
      },
      version: 2,
    );
  }

  Future<void> insertTodo(TodoModel todoModel) async {
    final db = await database;
    await db.rawInsert(
        // 'INSERT INTO tasks(title, description,category_id) VALUES("${todoModel.title}", "${todoModel.description}", "${todoModel.categoryId}")');
        'INSERT INTO tasks(description,category_id) VALUES("${todoModel.description}", "${todoModel.categoryId}")');
  }

  Future<void> insertCategory(Category category) async {
    final db = await database;
    await db.rawInsert(
        'INSERT INTO category(title, imageUrl) VALUES("${category.title}", "${category.imageUrl}")');
  }

  Future<List<Category>> getAllCategories() async {
    final db = await database;
    retrievalQuery = await db.rawQuery(
        "SELECT *,coalesce(oc.count, 0) as count FROM category c left join (select category_id, Count(*) as count from tasks group by category_id)  oc on (c.id == oc.category_id)");

    print(retrievalQuery.toString());
    return retrievalQuery.map((e) => Category.fromMap(e)).toList();
  }

  Future<int> getCountTodoByCategoryId(int categoryId) async {
    final db = await database;
    List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM tasks where category_id = ? ',
      [categoryId],
    );

    // log(result.toString());
    // int? count = Sqflite.firstIntValue(result);
    int count = result.first['count'] as int;
    // print("count of category = ${count}");
    return count;
  }

  Future<List<TodoModel>> getTodoByCategoryId(int categoryId) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db
        .rawQuery('SELECT * FROM tasks WHERE category_id = ?', [categoryId]);
    List<TodoModel> todos = [];
    log(result.toString());
    for (var row in result) {
      // print(row);
      TodoModel todo = TodoModel(
        id: row['id'],
        // title: row['title'],
        description: row['description'],
        categoryId: row['category_id'],
      );
      todos.add(todo);
      log(todos.length.toString());
    }
    return todos;
  }

  // Future<List<TodoModel>> getAllTodos() {

  // }
}
