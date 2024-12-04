import 'package:uuid/uuid.dart';

class Task {
  String id;
  String title;
  String description;
  String priority;
  DateTime date;
  bool isCompleted;
  bool isCanceled;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
    this.isCompleted = false,
    this.isCanceled = false,
    String? id,  // Tornar o `id` opcional e gerar um novo se for nulo
  }) : id = id ?? Uuid().v4();  // Gera um novo `id` se for nulo

  // Funções toJson e fromJson para incluir o campo id e isCanceled
  Map<String, dynamic> toJson() {
    return {
      'id': id,  // Incluindo o id na serialização
      'title': title,
      'description': description,
      'priority': priority,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
      'isCanceled': isCanceled,
    };
  }

  // Função para criar uma Task a partir de um JSON
  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
      date: DateTime.parse(json['date']),
      isCompleted: json['isCompleted'] ?? false,
      isCanceled: json['isCanceled'] ?? false,
      id: json['id'] ?? Uuid().v4(),  // Se `id` for nulo, gerar um novo
    );
  }
}
