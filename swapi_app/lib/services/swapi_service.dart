import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/categoria.dart';
import '../models/resultado.dart';

/// Erro de negócio da busca, com mensagem já pronta para o usuário.
class SwapiException implements Exception {
  const SwapiException(this.mensagem);

  final String mensagem;

  @override
  String toString() => mensagem;
}

/// Cliente da API pública SWAPI (https://swapi.dev/).
class SwapiService {
  SwapiService({http.Client? client}) : _client = client ?? http.Client();

  static const String _baseUrl = 'https://swapi.dev/api';

  final http.Client _client;

  /// Busca um registro pelo [id] dentro da [categoria] informada.
  ///
  /// Lança [SwapiException] quando o id não existe ou a requisição falha.
  Future<Resultado> buscar(Categoria categoria, int id) async {
    final uri = Uri.parse('$_baseUrl/${categoria.endpoint}/$id/');

    late final http.Response resposta;
    try {
      resposta = await _client.get(uri).timeout(const Duration(seconds: 15));
    } on SocketException {
      throw const SwapiException('Sem conexão com a internet.');
    } catch (_) {
      throw const SwapiException('Não foi possível concluir a requisição.');
    }

    if (resposta.statusCode == 404) {
      throw SwapiException(
        'Nenhum(a) ${categoria.rotulo.toLowerCase()} encontrado(a) com o id $id.',
      );
    }

    if (resposta.statusCode != 200) {
      throw SwapiException(
        'Erro ao consultar a SWAPI (código ${resposta.statusCode}).',
      );
    }

    final json = jsonDecode(utf8.decode(resposta.bodyBytes)) as Map<String, dynamic>;
    return Resultado.fromJson(categoria, id, json);
  }

  void dispose() => _client.close();
}
