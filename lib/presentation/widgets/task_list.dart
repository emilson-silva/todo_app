

import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/task_entitie.dart';
import 'package:todo_app/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(task: tasks[index]);
      },
    );
  }
}
