import 'package:flutter/material.dart';


class ListaDisciplinas extends StatefulWidget {
  @override
  _ListaDisciplinasState createState() => _ListaDisciplinasState();
}

class _ListaDisciplinasState extends State<ListaDisciplinas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lista de Disciplina"),),
    );
  }
}