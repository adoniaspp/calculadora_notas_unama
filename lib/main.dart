import 'package:calc_notas/view/cadastro_disciplina.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(AppNotas());
}

class AppNotas extends StatefulWidget {
  @override
  _AppNotasState createState() => _AppNotasState();
}

class _AppNotasState extends State<AppNotas> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroDisciplina(),
    );
  }
}