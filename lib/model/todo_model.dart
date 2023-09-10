// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  int? id;
  String? title;
  String? description;
  TodoModel({
    this.id,
    this.title,
    this.description,
  });

}

class Category {
  int? id;
  String? title;
  String? imageUrl;
  List<TodoModel>? todos;
  Category({
    this.id,
    this.title,
    this.imageUrl,
    this.todos, 
  });

}
