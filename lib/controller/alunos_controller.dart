import 'package:consumo_api/models/aluno.dart';
import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';
import 'package:consumo_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    //alunos.forEach((aluno) => print(aluno.nome));
    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos.add('Flutter Avançado');

    await _alunosRepository.update(aluno);

    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado.nome);
    print('Tem os cursos: ');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      id: '3',
      nome: 'Patrizia Gucci',
      nomeCursos: ['Animal raro Gucci'],
      endereco: Endereco(
        rua: 'Rua milano 504',
        numero: 456,
        cep: '1245-74',
        telefone: Telefone(ddd: 412, telefone: '4521-8745'),
        cidade: Cidade(
          id: 12,
          nome: 'Milão',
        ),
      ),
      cursos: [
        Curso(
          id: 1,
          nome: 'Animale e moda',
          isAluno: true,
        ),
        Curso(
          id: 2,
          nome: 'Animale e estilo',
          isAluno: true,
        ),
      ],
    );

    _alunosRepository.insert(aluno);
  }
}
