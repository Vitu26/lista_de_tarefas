import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/models/task.dart';

void main() {
  testWidgets('Deve exibir a lista de tarefas corretamente', (WidgetTester tester) async {
    final tasks = [
      Task(
        title: 'Tarefa 1',
        description: 'Descrição da tarefa 1',
        date: DateTime.now(),
        priority: 'Alta',
        isCompleted: false,
      ),
      Task(
        title: 'Tarefa 2',
        description: 'Descrição da tarefa 2',
        date: DateTime.now(),
        priority: 'Moderada',
        isCompleted: false,
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TaskList(
            tasks: tasks,
            onCompleted: (_) {},
            onEdit: (_) {},
            onTap: (_) {},
            onDelete: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('Tarefa 1'), findsOneWidget);
    expect(find.text('Tarefa 2'), findsOneWidget);
  });
}
