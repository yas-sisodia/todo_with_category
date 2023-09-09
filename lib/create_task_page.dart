import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/create_task_provider.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateTaskProvider>(context);
    TextEditingController taskDetails = TextEditingController();
    TextEditingController taskName = TextEditingController();
    TextEditingController quantity = TextEditingController();
    int indexCounter = 0;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Text(""),
          title: const Text(
            "New task",
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
                    controller: taskDetails,
                    keyboardType: TextInputType.multiline,
                    minLines: 3, // Set this
                    maxLines: 6,
                    decoration: const InputDecoration(
                        hintText: "What are you planning",
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/notification.png",
                            scale: 20,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            "May 29, 14:00",
                            style: TextStyle(fontSize: 24),
                          ),
                          // TextFormField()
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/note.png",
                            scale: 20,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          // const Text(
                          //   "Add note",
                          //   style: TextStyle(fontSize: 24, color: Colors.grey),
                          // ),
                          Flexible(
                            child: TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? null
                                  : "Title can't be blank!",
                              controller: taskName,
                              style: const TextStyle(fontSize: 24),
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                  hintText: "Add note",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 24, color: Colors.grey)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/category.png",
                            scale: 20,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          // const Text(
                          //   "Category",
                          //   style: TextStyle(fontSize: 24, color: Colors.grey),
                          // ),
                          DropdownButton<String>(
                            hint: const Text("Category",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.grey)),
                            items: <String>[
                              'Work',
                              'Music',
                              'Travel',
                              'Study',
                              'Home',
                              'Other'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                onTap: () {},
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                value = value;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        // height: 367.55,
                        height: 325,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String? path;
                    if (taskName.text.toLowerCase() == "work") {
                      path = "assets/working.png";
                    } else if (taskName.text.toLowerCase() == "music") {
                      path = "assets/music.png";
                    } else if (taskName.text.toLowerCase() == "travel") {
                      path = "assets/travel.png";
                    } else if (taskName.text.toLowerCase() == "study") {
                      path = "assets/study.png";
                    } else {
                      path = "assets/all.png";
                    }
                    TodoModel todoModel = TodoModel(
                        id: indexCounter,
                        title: taskName.text,
                        description: taskDetails.text,
                        imageUrl: path);
                    provider.addItemsInList(
                        todoModel, indexCounter, taskName.text, context);
                    indexCounter++;
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
