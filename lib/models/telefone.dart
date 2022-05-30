import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

//é um método que pega o objeto(Telefone) e  transforma em um map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {'ddd': ddd, 'telefone': telefone};
  }

// é um CONSTRUTOR ele vai pegar um MAP e trasforma em um objeto telefone
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'].toInt() ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

// é um método que retorna uma string Json do meu objeto Telefone
  String toJson() => json.encode(toMap());

  // é um método que baseado em uma String json retorna um objeto Telefome
  //factory Telefone.fromJson(String json) => Telefone.fromMap(json.decode(json));
  factory Telefone.fromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    final telefone = Telefone.fromMap(jsonMap);
    return telefone;
  }

  // se to => pega os meus dados e transforma em alguma coisa.
  //se from => criação baseada em um parametro.

  @override
  String toString() => 'Telefone(ddd: $ddd, telefone: $telefone)';
}
