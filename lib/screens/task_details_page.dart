// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/create_task_page.dart';
import 'package:todo_app/controllers/create_task_provider.dart';
import 'package:todo_app/utils/reuse.dart';

class TaskDetailsPage extends StatefulWidget {
  String categoryName;
  String imageUrl;
  String time;
  var id;
  TaskDetailsPage(
      {Key? key,
      required this.id,
      required this.categoryName,
      required this.imageUrl,
      required this.time})
      : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  // @override
  // void initState() {

  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              'assets/more.png',
              scale: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Consumer<CreateTaskProvider>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Image.asset(
                        widget.imageUrl,
                        scale: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.categoryName.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                    ),
                    Text(
                      "Created : ${Reuse.timeAgo(widget.time)}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "No. of tasks : ${value.todos.length}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: ListView.builder(
                    itemCount: value.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Center(
                            child: Text(
                          value.todos[index].description.toString(),
                          style: const TextStyle(color: Colors.black),
                        )),
                        trailing: Text(
                          Reuse.timeAgo(value.todos[index].time.toString()),
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
        // child:
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CreateTaskPage()));
        },
        child: const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 36,
            )),
      ),
    );
  }
}
