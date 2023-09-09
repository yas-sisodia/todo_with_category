// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/create_task_page.dart';
import 'package:todo_app/provider/create_task_provider.dart';

class TaskDetailsPage extends StatefulWidget {
  int index;
  TaskDetailsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Consumer<CreateTaskProvider>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: Image.asset(
                        value.categoryList[widget.index].imageUrl.toString(),
                        scale: 12,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      value.categoryList[widget.index].title.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                );
              },
              // child:
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Consumer<CreateTaskProvider>(
            builder: (context, value, child) {
              return Flexible(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        value.categoryList[widget.index].description.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              );
            },
            // child:
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateTaskPage()));
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
