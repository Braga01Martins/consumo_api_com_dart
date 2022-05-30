import 'dart:convert';

import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';

class Aluno {
  String? id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  Endereco endereco;
  List<Curso> cursos;

  Aluno({
    this.id,
    required this.nome,
     this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'endereco': endereco.toMap(),
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      idade: map['idade']?.toInt(),
      //nomeCursos: List<String>.from(['nomeCursos']),
      nomeCursos: map['nomeCursos'].cast<String>(),
      endereco: Endereco.fromMap(map['endereco']),
      cursos: map['cursos'].map<Curso>((cursoMap) => Curso.fromMap(cursoMap)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, endereco: $endereco, cursos: $cursos)';
  }


}
