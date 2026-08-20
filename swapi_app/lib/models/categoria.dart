/// Categorias que o usuário pode consultar na SWAPI.
///
/// Cada categoria conhece o seu endpoint e quais são os **cinco primeiros
/// campos** que devem ser exibidos na tela (o exercício pede apenas os cinco
/// primeiros dados de cada categoria).
enum Categoria {
  pessoa(
    rotulo: 'Pessoa',
    endpoint: 'people',
    campos: <String, String>{
      'name': 'Nome',
      'height': 'Altura',
      'mass': 'Peso',
      'hair_color': 'Cor do cabelo',
      'skin_color': 'Cor da pele',
    },
  ),
  planeta(
    rotulo: 'Planeta',
    endpoint: 'planets',
    campos: <String, String>{
      'name': 'Nome',
      'rotation_period': 'Período de rotação',
      'orbital_period': 'Período orbital',
      'diameter': 'Diâmetro',
      'climate': 'Clima',
    },
  ),
  nave(
    rotulo: 'Nave',
    endpoint: 'starships',
    campos: <String, String>{
      'name': 'Nome',
      'model': 'Modelo',
      'manufacturer': 'Fabricante',
      'cost_in_credits': 'Custo (créditos)',
      'length': 'Comprimento',
    },
  );

  const Categoria({
    required this.rotulo,
    required this.endpoint,
    required this.campos,
  });

  /// Texto exibido no Radio.
  final String rotulo;

  /// Caminho usado na URL da SWAPI (ex.: `people` em `/api/people/1/`).
  final String endpoint;

  /// Mapa `chave do JSON` -> `rótulo em português`, na ordem de exibição.
  final Map<String, String> campos;
}
