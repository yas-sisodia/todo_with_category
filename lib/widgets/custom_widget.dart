// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  String taskName;
  String numberOfTasks;
  String image;
  CustomCard({
    Key? key,
    required this.taskName,
    required this.numberOfTasks,
    required this.image,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 100,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              widget.image,
              scale: 12,
              // color: Colors.blue,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // widget.taskName,
                  widget.taskName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  // widget.numberOfTasks,
                  widget.numberOfTasks,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
