// lib/main.dart

import 'repository.dart';
import 'model.dart';

void main() async {
  // URL da API fictícia
  const apiUrl = 'https://jsonplaceholder.typicode.com/posts'; 

  // Criando a instância do repositório
  final repository = Repository(apiUrl: apiUrl);

  try {
    // Buscando os itens da API
    List<Item> items = await repository.fetchItems();

    // Exibindo os dados
    if (items.isNotEmpty) {
      print('Itens recebidos da API: \n');
      for (var item in items) {
        print(item);
      }
    } else {
      print('Nenhum item encontrado.');
    }
  } catch (e) {
    print('Erro ao acessar a API: $e');
  }
}
