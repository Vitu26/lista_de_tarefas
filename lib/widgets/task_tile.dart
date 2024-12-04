import 'package:flutter/material.dart';
import '../models/task.dart';
import '../pages/task_details_page.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onCompleted;
  final VoidCallback onEdit;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  TaskTile({
    required this.task,
    required this.onCompleted,
    required this.onEdit,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Color priorityColor;
    switch (task.priority) {
      case 'Alta':
        priorityColor = Colors.redAccent;
        break;
      case 'Moderada':
        priorityColor = Colors.orangeAccent;
        break;
      case 'Baixa':
        priorityColor = Colors.greenAccent;
        break;
      default:
        priorityColor = Colors.blueAccent;
    }

    return ListTile(
      tileColor: priorityColor.withOpacity(0.1),
      title: Row(
        children: [
          Expanded(child: Text(task.title)),
          if (task.isCompleted)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Concluída',
                style: TextStyle(color: Colors.white),
              ),
            )
        ],
      ),
      subtitle: Text('${task.description} - Prioridade: ${task.priority}'),
      trailing: PopupMenuButton<String>(
        icon: Icon(Icons.more_vert),
        onSelected: (String value) {
          switch (value) {
            case 'Concluída':
              onCompleted();
              break;
            case 'Editar':
              onEdit();
              break;
            case 'Deletar':
              onDelete(); // Chama a função de deletar pelo ID da tarefa
              break;
          }
        },
        itemBuilder: (BuildContext context) {
          return ['Concluída', 'Editar', 'Deletar'].map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetailsPage(task: task),
          ),
        );
      },
    );
  }
}
