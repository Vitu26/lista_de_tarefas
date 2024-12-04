import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/custom_appbar.dart';
import 'package:todo_app/widgets/filter_options.dart';
import 'package:todo_app/widgets/task_list.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import 'task_form_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  String _selectedPriorityTemp = 'Todas';
  String _selectedStatusTemp = 'Todas';
  String _selectedPriority = 'Todas';
  String _selectedStatus = 'Todas';

  String _formatDate(DateTime date) {
    return DateFormat('EEEE, d MMMM y', 'pt_BR').format(date);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskProvider>(context, listen: false)
          .filterByDate(_selectedDate);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterOptions(
          selectedPriorityTemp: _selectedPriorityTemp,
          selectedStatusTemp: _selectedStatusTemp,
          onPrioritySelected: (String priority) {
            setState(() {
              _selectedPriorityTemp = priority;
            });
          },
          onStatusSelected: (String status) {
            setState(() {
              _selectedStatusTemp = status;
            });
          },
          onOkPressed: () {
            setState(() {
              _selectedPriority = _selectedPriorityTemp;
              _selectedStatus = _selectedStatusTemp;
              Navigator.of(context).pop();
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Agenda Diária',
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.filter),
            onPressed: _showFilterOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    _formatDate(_selectedDate),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                List<Task> filteredTasks =
                    taskProvider.filterByDate(_selectedDate);

                if (_selectedPriority != 'Todas') {
                  filteredTasks = filteredTasks
                      .where((task) => task.priority == _selectedPriority)
                      .toList();
                }

                if (_selectedStatus == 'Concluídas') {
                  filteredTasks =
                      filteredTasks.where((task) => task.isCompleted).toList();
                }

                return filteredTasks.isEmpty
                    ? Center(
                        child: Text('Nenhuma tarefa encontrada para esta data.',
                            style: TextStyle(fontSize: 18)))
                    : TaskList(
                        tasks: filteredTasks,
                        onCompleted: (index) {
                          taskProvider.completeTask(index);
                        },
                        onEdit: (index) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TaskFormPage(
                                  task: taskProvider.tasks[index],
                                  index: index),
                            ),
                          );
                        },
                        onTap: (index) {},
                        onDelete: (index) {
                          taskProvider.deleteTaskById(
                              filteredTasks[index].id); // Passa o ID da tarefa
                        },
                      );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    TaskFormPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blue.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Adicionar Tarefa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
