class Disciplina 
{
  final int id;
  final String nome;
  final double nota1av;
  final double nota2av;
  final String situacao; //Aprovado, reprovado, Prova Final
  final double notaFinal;

  Disciplina({this.id, this.nome, this.nota1av, this.nota2av, this.situacao,
      this.notaFinal}); 

 
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'nome': nome,
      'nota1av': nota1av,
      'nota2av': nota2av,
      'situacao': situacao,
      'notaFinal': notaFinal
    };
  }
}
