import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApi {
  /// Busca na SWAPI. [categoria] é 'people', 'planets' ou 'starships'.
  /// Retorna os 5 primeiros dados. Retorna null se não encontrar.
  static Future<Map<String, dynamic>?> buscar(String categoria, String id) async {
    final url = Uri.parse('https://swapi.dev/api/$categoria/$id/');
    final resposta = await http.get(url);

    if (resposta.statusCode != 200) return null;

    final json = jsonDecode(resposta.body) as Map<String, dynamic>;
    // Só os cinco primeiros campos retornados pela API.
    return Map.fromEntries(json.entries.take(5));
  }
}
