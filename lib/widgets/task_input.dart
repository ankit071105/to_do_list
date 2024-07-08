// lib/widgets/task_input.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskInput extends StatelessWidget {
  final TextEditingController controller;

  TaskInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a new task',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Provider.of<TaskProvider>(context, listen: false).addTask(controller.text);
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
