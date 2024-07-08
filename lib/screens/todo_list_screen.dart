import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_input.dart';
import '../widgets/task_list.dart';

class ToDoListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false).clearCompletedTasks();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network('https://ideogram.ai/assets/progressive-image/balanced/response/sqMZJrC6QzCmsbi-DX-g0g' , width: 300,),
          ),
          SizedBox(height: 8.0), // Add space between the image and the input field
          TaskInput(controller: _controller),
          Expanded(
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
