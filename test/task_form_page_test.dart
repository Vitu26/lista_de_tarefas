import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/task_form_page.dart';
import 'package:todo_app/providers/task_provider.dart';

void main() {
  testWidgets('Deve exibir o formulário e salvar a tarefa corretamente', (WidgetTester tester) async {
    // Configurando o TaskProvider
    final taskProvider = TaskProvider();

    await tester.pumpWidget(
      ChangeNotifierProvider<TaskProvider>.value(
        value: taskProvider,
        child: MaterialApp(
          home: Scaffold(
            body: TaskFormPage(),
          ),
        ),
      ),
    );

    // Verifica se o campo título está presente
    expect(find.byType(TextFormField), findsNWidgets(3)); // Título, Descrição e Data

    // Preenche o formulário
    await tester.enterText(find.byType(TextFormField).first, 'Nova Tarefa');
    await tester.enterText(find.byType(TextFormField).last, 'Descrição da nova tarefa');

    // Toca no botão para salvar a tarefa
    await tester.tap(find.text('Salvar Tarefa'));
    
    // Espera que o Flutter resolva todos os timers e futuros pendentes
    await tester.pumpAndSettle();

    // Verifica se a tarefa foi adicionada no TaskProvider
    expect(taskProvider.tasks.length, 1);
    expect(taskProvider.tasks.first.title, 'Nova Tarefa');
    expect(taskProvider.tasks.first.description, 'Descrição da nova tarefa');
  });
}


    // testWidgets('Deve salvar a tarefa corretamente', (WidgetTester tester) async {
    //   await tester.pumpWidget(createTestWidget());

    //   // Preenche o formulário
    //   await tester.enterText(find.byType(TextFormField).first, 'Nova Tarefa');
    //   await tester.tap(find.byKey(Key('selectDateField')));
    //   await tester.pumpAndSettle();
    //   await tester.tap(find.text('15')); // Seleciona o dia 15
    //   await tester.tap(find.text('OK'));
    //   await tester.pumpAndSettle();
    //   await tester.enterText(find.byType(TextFormField).last, 'Descrição da tarefa');

    //   // Salva a tarefa
    //   await tester.tap(find.byKey(Key('saveTaskButton')));
    //   await tester.pumpAndSettle();

    //   // Verifica se a tarefa foi salva no provider
    //   expect(taskProvider.tasks.length, 1);
    //   expect(taskProvider.tasks.first.title, 'Nova Tarefa');
    //   expect(taskProvider.tasks.first.description, 'Descrição da tarefa');
    // });

    // testWidgets('Deve editar uma tarefa existente', (WidgetTester tester) async {
    //   final task = Task(
    //     title: 'Tarefa Existente',
    //     description: 'Descrição existente',
    //     date: DateTime(2024, 9, 15),
    //     priority: 'Moderate',
    //   );

    //   taskProvider.addTask(task);

    //   await tester.pumpWidget(createTestWidget(task: task, index: 0));

    //   // Verifica se os campos estão pré-preenchidos
    //   expect(find.text('Tarefa Existente'), findsOneWidget);
    //   expect(find.text('Descrição existente'), findsOneWidget);

    //   // Edita o título e a descrição
    //   await tester.enterText(find.byType(TextFormField).first, 'Tarefa Editada');
    //   await tester.enterText(find.byType(TextFormField).last, 'Descrição editada');

    //   // Salva a edição
    //   await tester.tap(find.byKey(Key('saveTaskButton')));
    //   await tester.pumpAndSettle();

    //   // Verifica se a tarefa foi atualizada
    //   expect(taskProvider.tasks[0].title, 'Tarefa Editada');
    //   expect(taskProvider.tasks[0].description, 'Descrição editada');
    // });