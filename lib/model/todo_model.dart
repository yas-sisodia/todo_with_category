import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  int? id;
  String? time;
  String? description;
  int? categoryId;
  TodoModel({
    this.id,
    this.time,
    this.description,
    this.categoryId,
  });
}

class Category {
  int? id;
  String? title;
  String? imageUrl;
  String? time;
  int count = 0;
  List<TodoModel>? todos;
  Category(
      {this.id,
      this.title,
      this.imageUrl,
      this.todos,
      this.count = 0,
      this.time});

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'title': title,
  //     'imageUrl': imageUrl,
  //     'todos': todos.map((x) => x?.toMap()).toList(),
  //   };
  // }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        id: map['id'],
        title: map['title'],
        imageUrl: map['imageUrl'],
        count: map['count'],
        time: map['time']
        // todos: map['todos'] != null ? List<TodoModel>.from((map['todos'] as List<int>).map<TodoModel?>((x) => TodoModel.fromMap(x as Map<String,dynamic>),),) : null,
        );
  }

  // String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
