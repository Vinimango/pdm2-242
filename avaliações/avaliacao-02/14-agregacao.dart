import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  String getNome() {
    return _nome;
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": _nome,
      "dependentes": _dependentes.map((d) => d.getNome()).toList()
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome do projeto": _nomeProjeto,
      "funcionários": _funcionarios.map((f) => f.toJson()).toList()
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  List<Dependente> dependentes = [];
  dependentes.add(Dependente("João"));
  dependentes.add(Dependente("Giratin"));
  dependentes.add(Dependente("Keldeo"));
  dependentes.add(Dependente("Regice"));
  dependentes.add(Dependente("Regigias"));
  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [];
  funcionarios.add(Funcionario("Exodia", [dependentes[0], dependentes[2]]));
  funcionarios.add(Funcionario("Primordial", [dependentes[1]]));
  funcionarios.add(Funcionario("Barão Na'shor", [dependentes[0], dependentes[2]]));
  funcionarios.add(Funcionario("Herione", []));
  funcionarios.add(Funcionario("Zekrom", [dependentes[3], dependentes[4]]));
  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  var equipeProjeto = EquipeProjeto("Loja de peças de carros", funcionarios); 
  // 6. Printar no formato JSON o objeto Equipe Projeto.
  
  //Converte para json sem quebra de linha
  //print(json.encode(equipeProjeto));
  
  //Converte para json com quebra de linha
  var enconder = JsonEncoder.withIndent('  ');
  String equipeProjetoJson = enconder.convert(equipeProjeto.toJson());

  print(equipeProjetoJson);
}
