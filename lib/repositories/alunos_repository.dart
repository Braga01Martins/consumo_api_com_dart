import 'dart:convert';
import 'package:consumo_api/models/aluno.dart';
import 'package:http/http.dart' as http;

// A pasta  repositury faz os acessos a API
class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse =
        await http.get(Uri.parse('http://localhost:3031/alunos'));

    final alunosList = jsonDecode(alunosResponse.body);

    return alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
  }

  // busca os dadso de acordo com o id de cada aluno
  Future<Aluno> findById(String id) async {
    final alunoResponse =
        await http.get(Uri.parse('http://localhost:3031/alunos/$id'));

    // final alunoMap = jsonDecode(alunoResponse.body);
    // return Aluno.fromMap(alunoMap);
    return Aluno.fromJson(alunoResponse.body);
  }

// ATUALIZA OS DADOS 
  Future<void> update(Aluno aluno) async {
    await http.put(
      Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
      body: aluno.toJson(),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  Future<void> insert(Aluno aluno) async {
    await http.post(
      Uri.parse('http://localhost:3031/alunos/'),
      body: aluno.toJson(),
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}
