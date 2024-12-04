import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? taskData = prefs.getString('tasks');
    if (taskData != null) {
      List<dynamic> decodedTasks = jsonDecode(taskData);
      _tasks = decodedTasks.map((task) => Task.fromJson(task)).toList();
    }
    notifyListeners();
  }

  void saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> taskList =
        _tasks.map((task) => task.toJson()).toList();
    await prefs.setString('tasks', jsonEncode(taskList));
  }

  void addTask(Task task) {
    _tasks.add(task);
    saveTasks();
    notifyListeners();
  }

  void updateTask(int index, Task task) {
    _tasks[index] = task;
    saveTasks();
    notifyListeners();
  }

  void completeTask(int index) {
    _tasks[index].isCompleted = true;
    saveTasks();
    notifyListeners();
  }

  void deleteTaskById(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    saveTasks();
    notifyListeners();
  }

  // Função para Filtrar as Tarefas de Acordo com a Situação
  List<Task> filterTasks(String filterType) {
    if (filterType == 'Todas') {
      return _tasks;
    } else if (filterType == 'Concluídas') {
      return _tasks.where((task) => task.isCompleted).toList();
    }
    return _tasks;
  }

  // Função para Filtrar Tarefas por Data
  List<Task> filterByDate(DateTime selectedDate) {
    return _tasks.where((task) {
      return task.date.year == selectedDate.year &&
          task.date.month == selectedDate.month &&
          task.date.day == selectedDate.day;
    }).toList();
  }

  List<Task> filterByToday() {
    DateTime today = DateTime.now();
    return _tasks.where((task) {
      return task.date.year == today.year &&
          task.date.month == today.month &&
          task.date.day == today.day;
    }).toList();
  }

  // Prioridade
  List<Task> filterByPriority(String filterPriority) {
    return _tasks.where((task) => task.priority == filterPriority).toList();
  }
}
