/// Modelo que representa um usuário cadastrado no CineMatch.
class Usuario {
  final String nome;
  final String email;
  final String senha;
  final List<String> generosFavoritos; // checkboxes
  final String plataformaPreferida; // radio buttons
  final bool receberNotificacoes; // switch
  final bool perfilPublico; // switch

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
    required this.generosFavoritos,
    required this.plataformaPreferida,
    required this.receberNotificacoes,
    required this.perfilPublico,
  });
}

/// Vetor global que armazena os usuários cadastrados.
/// Já contém um usuário de teste para facilitar o login.
final List<Usuario> usuariosCadastrados = [
  Usuario(
    nome: 'Admin CineMatch',
    email: 'admin@cinematch.com',
    senha: '123456',
    generosFavoritos: ['Ação', 'Ficção Científica'],
    plataformaPreferida: 'Netflix',
    receberNotificacoes: true,
    perfilPublico: true,
  ),
];
