import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';

void main() {
  group('TaskProvider Tests', () {
    late TaskProvider taskProvider;

    setUp(() {
      taskProvider = TaskProvider();
    });

    test('Deve adicionar uma nova tarefa', () {
      final task = Task(
        title: 'Nova Tarefa',
        description: 'Descrição da tarefa',
        date: DateTime.now(),
        priority: 'Moderada',
        isCompleted: false,
      );
      taskProvider.addTask(task);

      expect(taskProvider.tasks.length, 1);
      expect(taskProvider.tasks[0].title, 'Nova Tarefa');
    });

    test('Deve atualizar uma tarefa existente', () {
      final task = Task(
        title: 'Tarefa Atualizada',
        description: 'Descrição',
        date: DateTime.now(),
        priority: 'Alta',
        isCompleted: false,
      );
      taskProvider.addTask(task);
      
      final updatedTask = Task(
        title: 'Tarefa Modificada',
        description: 'Descrição Modificada',
        date: DateTime.now(),
        priority: 'Baixa',
        isCompleted: false,
      );

      taskProvider.updateTask(0, updatedTask);

      expect(taskProvider.tasks[0].title, 'Tarefa Modificada');
    });

    test('Deve remover uma tarefa existente', () {
      final task = Task(
        title: 'Tarefa para deletar',
        description: 'Descrição da tarefa',
        date: DateTime.now(),
        priority: 'Moderada',
        isCompleted: false,
      );
      taskProvider.addTask(task);
      taskProvider.deleteTaskById(task.id);

      expect(taskProvider.tasks.length, 0);
    });
  });
}
