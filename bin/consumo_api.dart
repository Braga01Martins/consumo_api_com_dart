import 'dart:convert';
import 'package:consumo_api/consumo_api.dart' as consumo_api;
import 'package:consumo_api/controller/alunos_controller.dart';
import 'package:consumo_api/models/telefone.dart';

void main() {
  //AlunosController().findAll();
  //AlunosController().findById('2');
  //lunosController().update();
  //AlunosController().insert();
  AlunosController().findById('62edbfb0-e070-11ec-a1b1-a18d0498b3f6');
}

void main2(List<String> arguments) {
  final cidadeJson = '''
  [{
    "id": 1,
    "nome": "São Paulo"
},
{
    "id": 2,
    "nome": "São Bento"
}
]
  ''';

// [] => List<dynamic>
// {} => Map<String, dynamic>

  final cidadeMap = json.decode(cidadeJson);

  if (cidadeMap is List) {
    print('É uma lista');
  } else if (cidadeMap is Map) {
    print('É um Map');
  }

  print(cidadeMap.runtimeType);

  // fazer um forEach para varrer a lista
  cidadeMap.forEach((city) => print(city['nome']));

  //print(cidadeMap[0].runtimeType);

  final cidadeMapJson = <String, dynamic>{
    'id': 123,
    'nome': "Sao Paulo",
    'uf': "SP"
  };

  print(json.encode(cidadeMapJson));

  final telefoneJson = '''

    {
      "ddd": 11,
      "telefone": "123456789"
    }

''';

  final telefone = Telefone.fromJson(telefoneJson);
  print(telefone.ddd);
  print(telefone.telefone);
  print(telefone.toJson());
  print(telefone.toMap());
}
