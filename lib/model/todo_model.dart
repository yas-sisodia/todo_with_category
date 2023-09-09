// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  int? id;
  String? title;
  String? description;
  String? imageUrl;
  TodoModel({this.id, this.title, this.description, this.imageUrl});

  Map<String, Object?> toMap() {
    return {
      'id': id.toString(),
      'title': title.toString(),
      'description': description.toString(),
      'imageUrl': imageUrl.toString()
    };
  }

  TodoModel.fromMap(Map<String,dynamic> map) {

    id = map["id"]; 
    title = map['title'];
    description = map['description'];
    imageUrl = map['imageUrl'];

  }

  @override
  String toString() {
    return "TodoModel{id:$id, title:$title, description:$description, imageUrl:$imageUrl}";
  }
}

// class Category {

//   int? id;
//   String? title;
//   String? imageUrl;
//   List<TodoModel>? todos;
//   Category({
//     this.id,
//     this.title,
//     this.imageUrl, 
//     this.todos, 
//   });

// }
