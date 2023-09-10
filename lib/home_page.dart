import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/create_task_page.dart';
import 'package:todo_app/widgets/custom_widget.dart';
import 'package:todo_app/provider/create_task_provider.dart';
import 'package:todo_app/task_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/menu.png',
                scale: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lists",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Consumer<CreateTaskProvider>(builder: ((context, value, child) {
                var categoryList = value.categoryList.keys.toList();
                return GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TaskDetailsPage(
                                      index: "TaskDetailsPage",
                                    )));
                      },
                      child: CustomCard(
                        taskName: categoryList[index],
                        numberOfTasks: (value.categoryList[categoryList[index]]
                                    ?.todos?.length ??
                                0)
                            .toString(),
                        image: value.categoryList[categoryList[index]]!.imageUrl
                            .toString(),
                        // image: value.categoryList[index]?.imageUrl ??
                        //     "assets/all.png"
                      ),
                    );
                  },
                  itemCount: value.categoryList.length,
                );
              }))
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CreateTaskPage()));
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
