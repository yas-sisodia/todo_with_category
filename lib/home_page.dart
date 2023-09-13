import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/create_category_page.dart';
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
                // var categoryList = value.categoryList.keys.toList();
                // var categoryList = value.categoryList;
                return GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        print("Clicked on card");
                        value.getTodosByCategoryId(
                            value.categoryList[index].id!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TaskDetailsPage(
                                      imageUrl: value
                                          .categoryList[index].imageUrl
                                          .toString(),
                                      categoryName: value
                                          .categoryList[index].title
                                          .toString(),
                                      id: value.categoryList[index].id,
                                    )));
                      },
                      child: CategoryCard(
                        title: value.categoryList[index].title.toString(),
                        subTitle: value.categoryList[index].count.toString(),
                        image: value.categoryList[index].imageUrl.toString(),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateCategoryPage()));
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
