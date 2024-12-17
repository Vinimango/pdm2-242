// lib/repository.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Repository {
  final String apiUrl;

  Repository({required this.apiUrl});

  // Método para buscar os itens da API
  Future<List<Item>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      // Verifique se a resposta tem sucesso (statusCode 200)
      if (response.statusCode == 200) {
        // Imprimir o corpo da resposta para depuração
        print('Resposta da API: ${response.body}');
        
        // Verifique se o corpo não é nulo ou vazio
        if (response.body.isEmpty) {
          throw Exception('Corpo da resposta está vazio');
        }

        // Se a resposta for bem-sucedida, parse o JSON
        List<dynamic> data = json.decode(response.body);

        // Verifique se a resposta é um formato válido
        if (data is List) {
          return data.map((json) => Item.fromJson(json)).toList();
        } else {
          throw Exception('Resposta inesperada: esperado um JSON do tipo lista');
        }
      } else {
        throw Exception('Falha ao carregar os dados: statusCode ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao acessar a API: $e');
    }
  }
}


