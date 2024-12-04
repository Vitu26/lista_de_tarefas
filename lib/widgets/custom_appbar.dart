import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue, // Ajuste a cor de fundo da AppBar
      centerTitle: true, // Centraliza o título
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white, // Define o texto como branco
          fontSize: 20, // Ajuste o tamanho da fonte se necessário
          fontWeight: FontWeight.bold, // Ajuste o peso da fonte, se desejado
        ),
      ),
      actions: actions, // Ações opcionais, como botões ou ícones
      elevation: 0, // Remove a sombra abaixo da AppBar (opcional)
      iconTheme: const IconThemeData(
        color: Colors.white, // Define a cor dos ícones como branca
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
