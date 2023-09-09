import 'package:flutter/material.dart';
import 'package:todo_app/home_page.dart';
import 'package:todo_app/service/database_service.dart';
import '../model/todo_model.dart';

class CreateTaskProvider extends ChangeNotifier {

  CreateTaskProvider() {
    getTodos(); 
  }
  var cartegorySize = 0;
  List<TodoModel> todos = []; 

  void addItemsInList(TodoModel todoModel, String title,
      BuildContext context)  {
        TodoDatabase.singleton.insertTask(todoModel); 
         Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomePage()));
         getTodos(); 
     
  }

  Future<void> getTodos() async {
    todos = await TodoDatabase.singleton.getData(); 
    notifyListeners();
  }
}
