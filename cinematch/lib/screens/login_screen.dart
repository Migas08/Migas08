import 'package:flutter/material.dart';
import '../main.dart';
import '../models/usuario.dart';

/// Tela de login: valida os campos e procura, entre os usuários
/// cadastrados, se usuário e senha são válidos.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _fazerLogin() {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final senha = _senhaController.text;

    // Procura no vetor de usuários cadastrados
    Usuario? usuarioEncontrado;
    for (final u in usuariosCadastrados) {
      if (u.email.toLowerCase() == email.toLowerCase() && u.senha == senha) {
        usuarioEncontrado = u;
        break;
      }
    }

    if (usuarioEncontrado != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.fundoCard,
          icon: const Icon(Icons.check_circle,
              color: Colors.greenAccent, size: 48),
          title: const Text('Login realizado!'),
          content: Text(
            'Bem-vindo(a) de volta, ${usuarioEncontrado!.nome}! 🎬\n'
            'Prepare a pipoca!',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // fecha o diálogo
                Navigator.pop(context); // volta para a home
              },
              child: const Text('CONTINUAR'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.vermelho,
          content: Text('E-mail ou senha incorretos. Tente novamente!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LOGIN')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.movie,
                    size: 80, color: AppColors.vermelho),
                const SizedBox(height: 8),
                const Text(
                  'Bem-vindo de volta!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dourado,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Entre para receber suas recomendações',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textoSuave),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Informe o e-mail';
                    }
                    if (!valor.contains('@') || !valor.contains('.')) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _senhaController,
                  obscureText: !_senhaVisivel,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _senhaVisivel
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.textoSuave,
                      ),
                      onPressed: () =>
                          setState(() => _senhaVisivel = !_senhaVisivel),
                    ),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Informe a senha';
                    }
                    if (valor.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  onPressed: _fazerLogin,
                  icon: const Icon(Icons.login),
                  label: const Text('ENTRAR'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/cadastro'),
                  child: const Text(
                    'Não tem conta? Cadastre-se aqui',
                    style: TextStyle(color: AppColors.dourado),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Usuário de teste: admin@cinematch.com / 123456',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: AppColors.textoSuave, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
