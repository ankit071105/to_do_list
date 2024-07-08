// lib/widgets/task_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return ListTile(
              title: Text(task.title),
              leading: Checkbox(
                value: task.isCompleted,
                onChanged: (bool? value) {
                  taskProvider.toggleTaskCompletion(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
