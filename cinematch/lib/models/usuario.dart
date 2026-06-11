// Classe Usuario, com atributos privados, construtor e métodos get/set
// (como visto na aula de Entrada de Dados - cadastro de objetos em vetor)
class Usuario {
  String _nome;
  String _email;
  String _senha;
  String _generos; // gêneros favoritos (checkboxes)
  String _plataforma; // plataforma preferida (radio)
  bool _notificacoes; // switch
  bool _perfilPublico; // switch

  // construtor
  Usuario(this._nome, this._email, this._senha, this._generos,
      this._plataforma, this._notificacoes, this._perfilPublico);

  // métodos get
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;
  String get generos => _generos;
  String get plataforma => _plataforma;
  bool get notificacoes => _notificacoes;
  bool get perfilPublico => _perfilPublico;

  // métodos set
  set nome(String valor) => _nome = valor;
  set email(String valor) => _email = valor;
  set senha(String valor) => _senha = valor;
  set generos(String valor) => _generos = valor;
  set plataforma(String valor) => _plataforma = valor;
  set notificacoes(bool valor) => _notificacoes = valor;
  set perfilPublico(bool valor) => _perfilPublico = valor;
}

// Vetor (List) que armazena os usuários cadastrados.
// Já inclui um usuário fake para testar o login, como sugerido na aula.
List<Usuario> usuariosCadastrados = [
  Usuario('Admin', 'admin@cinematch.com', '123456', 'Ação, Ficção Científica',
      'Netflix', true, true),
];
