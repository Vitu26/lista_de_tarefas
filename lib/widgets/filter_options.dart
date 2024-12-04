import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  final String selectedPriorityTemp;
  final String selectedStatusTemp;
  final Function(String) onPrioritySelected;
  final Function(String) onStatusSelected;
  final Function() onOkPressed;

  FilterOptions({
    required this.selectedPriorityTemp,
    required this.selectedStatusTemp,
    required this.onPrioritySelected,
    required this.onStatusSelected,
    required this.onOkPressed,
  });

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  late String _selectedPriority;
  late String _selectedStatus;

  @override
  void initState() {
    super.initState();
    // Inicializar os valores temporários de prioridade e status com os valores recebidos
    _selectedPriority = widget.selectedPriorityTemp;
    _selectedStatus = widget.selectedStatusTemp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filtrar por Estado:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGradientButton(
                'Todas',
                _selectedStatus == 'Todas',
                () {
                  setState(() {
                    _selectedStatus = 'Todas';
                    widget.onStatusSelected(_selectedStatus); // Atualizar o estado selecionado
                  });
                },
              ),
              _buildGradientButton(
                'Concluídas',
                _selectedStatus == 'Concluídas',
                () {
                  setState(() {
                    _selectedStatus = 'Concluídas';
                    widget.onStatusSelected(_selectedStatus);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Filtrar por Prioridade:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGradientButton(
                'Todas',
                _selectedPriority == 'Todas',
                () {
                  setState(() {
                    _selectedPriority = 'Todas';
                    widget.onPrioritySelected(_selectedPriority);
                  });
                },
              ),
              _buildGradientButton(
                'Alta',
                _selectedPriority == 'Alta',
                () {
                  setState(() {
                    _selectedPriority = 'Alta';
                    widget.onPrioritySelected(_selectedPriority);
                  });
                },
              ),
              _buildGradientButton(
                'Moderada',
                _selectedPriority == 'Moderada',
                () {
                  setState(() {
                    _selectedPriority = 'Moderada';
                    widget.onPrioritySelected(_selectedPriority);
                  });
                },
              ),
              _buildGradientButton(
                'Baixa',
                _selectedPriority == 'Baixa',
                () {
                  setState(() {
                    _selectedPriority = 'Baixa';
                    widget.onPrioritySelected(_selectedPriority);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: widget.onOkPressed,
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientButton(String text, bool isSelected, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blue.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
