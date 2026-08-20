import 'categoria.dart';

/// Um par rótulo/valor já pronto para ser exibido na tela.
class Campo {
  const Campo(this.rotulo, this.valor);

  final String rotulo;
  final String valor;
}

/// Resultado de uma busca na SWAPI, contendo apenas os cinco primeiros campos
/// da categoria consultada.
class Resultado {
  const Resultado({
    required this.categoria,
    required this.id,
    required this.campos,
  });

  final Categoria categoria;
  final int id;
  final List<Campo> campos;

  /// Monta o resultado a partir do JSON da SWAPI, filtrando e ordenando os
  /// campos conforme [Categoria.campos].
  factory Resultado.fromJson(
    Categoria categoria,
    int id,
    Map<String, dynamic> json,
  ) {
    final campos = categoria.campos.entries.map((entrada) {
      final valor = json[entrada.key];
      final texto = (valor == null || '$valor'.trim().isEmpty)
          ? 'Não informado'
          : '$valor';
      return Campo(entrada.value, texto);
    }).toList();

    return Resultado(categoria: categoria, id: id, campos: campos);
  }

  /// Nome do item, usado como título do card de resultado.
  String get titulo => campos.isEmpty ? '${categoria.rotulo} $id' : campos.first.valor;
}
