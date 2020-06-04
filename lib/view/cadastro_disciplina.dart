import 'package:calc_notas/models/disciplina.dart';
import 'package:calc_notas/services/service_bd.dart';
import 'package:flutter/material.dart';

class CadastroDisciplina extends StatefulWidget {
  @override
  _CadastroDisciplinaState createState() => _CadastroDisciplinaState();
}

class _CadastroDisciplinaState extends State<CadastroDisciplina> {
  final disciplinaController = TextEditingController();
  final nota1avController = TextEditingController();
  final nota2avController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  SQLiteService sqLiteService;

  @override
  void initState(){
    sqLiteService = SQLiteService();
    sqLiteService.inicializacao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculo de Notas"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: disciplinaController,
                decoration: InputDecoration(labelText: "Disciplina"),
              ),
              TextFormField(
                controller: nota1avController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Nota 1º Avaliação"),
              ),
              TextFormField(
                controller: nota2avController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Nota 2º Avaliação"),
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  sqLiteService.insertDisciplina(Disciplina(  
                    nome: disciplinaController.text,
                    nota1av: double.parse(nota1avController.text),
                    nota2av: double.parse(nota2avController.text),
                  ));
                },)
            ],
          ),
        ),
      ),
    );
  }
}
