import 'package:flutter/material.dart';
import '../models/usuario.dart';

// Tela de login: usa Form + TextFormField com validator (aula de
// Entrada de Dados) e procura no vetor de usuários cadastrados
// se o e-mail e a senha informados são válidos.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // chave (GlobalKey) para manter o estado do formulário
  final _formKey = GlobalKey<FormState>();

  // controllers para manipular o conteúdo dos campos
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();

  void fazerLogin() {
    // chama todos os validators do Form
    if (_formKey.currentState!.validate()) {
      bool encontrou = false;
      String nomeUsuario = '';

      // procura no vetor de usuários cadastrados
      for (int i = 0; i < usuariosCadastrados.length; i++) {
        if (usuariosCadastrados[i].email == campoEmail.text &&
            usuariosCadastrados[i].senha == campoSenha.text) {
          encontrou = true;
          nomeUsuario = usuariosCadastrados[i].nome;
        }
      }

      if (encontrou) {
        // mensagem de sucesso com showDialog e AlertDialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Login realizado! 🎬'),
              content: Text('Bem-vindo(a), $nomeUsuario! Prepare a pipoca!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // fecha o diálogo
                    Navigator.pop(context); // volta para a home
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // mensagem de erro com AlertDialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro ❌'),
              content: const Text('E-mail ou senha incorretos!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('TENTAR NOVAMENTE'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE50914),
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.movie, size: 80, color: Color(0xFFE50914)),
                const SizedBox(height: 8),
                const Text(
                  'Bem-vindo de volta!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: campoEmail,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    icon: const Icon(Icons.email, color: Color(0xFFFFC857)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // validator retorna mensagem de erro ou null se válido
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'O campo e-mail não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: campoSenha,
                  obscureText: true, // esconde a senha
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    icon: const Icon(Icons.lock, color: Color(0xFFFFC857)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'O campo senha não pode ser vazio';
                    }
                    if (valor.length < 3) {
                      return 'A senha não pode ter menos que 3 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE50914),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: fazerLogin,
                  child: const Text('ENTRAR'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A26),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // limpa os campos e as mensagens de erro
                    campoEmail.clear();
                    campoSenha.clear();
                    _formKey.currentState!.reset();
                  },
                  child: const Text('LIMPAR'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC857),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('VOLTAR'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Usuário de teste: admin@cinematch.com / 123456',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
