import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class CreateTaskProvider extends ChangeNotifier {
  var cartegorySize = 0;
  Map<String, Category> categoryList = {
    // "All": Category(
    //   id: 1,
    //   title: "All",
    // ),
    // "Home": Category(
    //   id: 2,
    //   title: "Home",
    // ),
  };
  void addItemsInList(TodoModel todoModel, int indexCounter, String title,
      String path, BuildContext context) {
    // String? path;
    if (categoryList[title.toLowerCase()] == null) {
      categoryList[title.toLowerCase()] = Category(
          title: title.toLowerCase(), id: ++cartegorySize, imageUrl: path);
    }
    categoryList[title.toLowerCase()]?.todos ??= [];
    categoryList[title.toLowerCase()]?.todos?.add(todoModel);
    notifyListeners();
    Navigator.pop(context);
  }
}
