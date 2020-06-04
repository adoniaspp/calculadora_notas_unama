import 'package:calc_notas/models/disciplina.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteService{
  
  Future<Database> database;

  //Inicializar o bd ou abrir o bd
  Future<void> inicializacao() async
  {
    database = openDatabase(
      join(await getDatabasesPath(), 'academico.db'),
      onCreate: (db, version){
        return db.execute("CREATE TABLE notas (id INTEGER PRIMARY KEY, nome TEXT, nota1av DOUBLE, nota2av DOUBLE, situacao TEXT, notaFinal DOUBLE)");
      },
      version: 1,
    );
  }

  //Inserir Disciplina
  Future<void> insertDisciplina(Disciplina disciplina) async
  {
    final Database db = await this.database;
    final media = disciplina.nota1av + disciplina.nota2av / 2;
    if(media >= 7){
      //aprovado
    }else if(media < 7 && media > 4){
      //prova final
    }else{
      //Reprovado
    }
    await db.insert('notas', disciplina.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  //Listar as disciplinas
  Future<List<Disciplina>> listDisciplinas() async{
    final Database db = await this.database;
    final List<Map<String, dynamic>> disciplinas = await db.query('notas');
    return List.generate(disciplinas.length, (i) => 
    Disciplina(
      id: disciplinas[i]['id'],
      nome: disciplinas[i]['nome'],
      nota1av: disciplinas[i]['nota1av'],
      nota2av: disciplinas[i]['nota2av']
    ));
  }  
}