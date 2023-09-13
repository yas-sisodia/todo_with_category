import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart' as todo;
import 'package:todo_app/controllers/create_task_provider.dart';

class CreateCategoryPage extends StatelessWidget {
  CreateCategoryPage({super.key});

  final TextEditingController editingController = TextEditingController();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Text(""),
          title: const Text(
            "New Category",
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  "assets/cancel.png",
                  scale: 25,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  // height: 200,
                  color: Colors.amber[50],
                  child: TextFormField(
                    controller: editingController,
                    keyboardType: TextInputType.multiline,
                    minLines: 3, // Set this
                    maxLines: 6,
                    decoration: const InputDecoration(
                        hintText: "Category Title", border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      // Row(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Image.asset(
                      //       "assets/notification.png",
                      //       scale: 20,
                      //       color: Colors.blue,
                      //     ),
                      //     const SizedBox(
                      //       width: 30,
                      //     ),
                      //     const Text(
                      //       "May 29, 14:00",
                      //       style: TextStyle(fontSize: 24),
                      //     ),
                      //     // TextFormField()
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Image.asset(
                      //       "assets/note.png",
                      //       scale: 20,
                      //       color: Colors.blue,
                      //     ),
                      //     const SizedBox(
                      //       width: 30,
                      //     ),
                      //     // const Text(
                      //     //   "Add note",
                      //     //   style: TextStyle(fontSize: 24, color: Colors.grey),
                      //     // ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Image.asset(
                      //       "assets/category.png",
                      //       scale: 20,
                      //       color: Colors.blue,
                      //     ),
                      //     const SizedBox(
                      //       width: 30,
                      //     ),
                      //     // const Text(
                      //     //   "Category",
                      //     //   style: TextStyle(fontSize: 24, color: Colors.grey),
                      //     // ),
                      //   ],
                      // ),
                      const SizedBox(
                        // height: 367.55,
                        height: 325,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var categoryName =
                        editingController.text.toLowerCase().trim();
                    print(time);
                    String? path;
                    if (categoryName.isNotEmpty) {
                      if (categoryName == "work") {
                        path = "assets/working.png";
                      } else if (categoryName == "music") {
                        path = "assets/music.png";
                      } else if (categoryName == "travel") {
                        path = "assets/travel.png";
                      } else if (categoryName == "study") {
                        path = "assets/study.png";
                      } else {
                        path = "assets/all.png";
                      }
                      var toInsertCategory = todo.Category(
                          title: categoryName,
                          imageUrl: path,
                          time: time.toString());
                      context
                          .read<CreateTaskProvider>()
                          .createCategory(toInsertCategory, context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    // width: double.,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "CREATE",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
