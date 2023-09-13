import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/service/todo_database_service.dart';
import '../model/todo_model.dart';
import '../model/todo_model.dart' as todo;

class CreateTaskProvider extends ChangeNotifier {
  var cartegorySize = 0;
  CreateTaskProvider() {
    getAllCategories();
  }

  List<todo.Category> categoryList = [];

  void createCategory(todo.Category category, BuildContext context) async {
    await TodoDatabaseService.singleton.insertCategory(category);
    getAllCategories();

    Navigator.pop(context);
  }

  void addItemsInList(
      TodoModel todoModel, int categoryId, BuildContext context) async {
    todoModel.categoryId = categoryId;
    await TodoDatabaseService.singleton.insertTodo(todoModel);
    getAllCategories();
    getTodosByCategoryId(categoryId);
    Navigator.pop(context);
  }

  Future<void> getAllCategories() async {
    categoryList = await TodoDatabaseService.singleton.getAllCategories();
    notifyListeners();
  }

  List<TodoModel> todos = [];
  Future<void> getTodosByCategoryId(int id) async {
    // log(id);
    print("Get Todos Function");
    todos = await TodoDatabaseService.singleton.getTodoByCategoryId(id);
    print("length of todos = ${todos.length}");
    notifyListeners();
  }
}
