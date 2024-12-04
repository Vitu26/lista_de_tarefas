import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onCompleted;
  final Function(int) onEdit;
  final Function(int) onTap;
  final Function(int) onDelete;

  TaskList({
    required this.tasks,
    required this.onCompleted,
    required this.onEdit,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
      ),
      itemBuilder: (context, index) {
        return TaskTile(
          task: tasks[index],
          onCompleted: () => onCompleted(index),
          onEdit: () => onEdit(index),
          onTap: () => onTap(index),
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}
