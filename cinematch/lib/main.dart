import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/descricao_screen.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/busca_screen.dart';
import 'screens/sobre_nos_screen.dart';

void main() {
  runApp(const CineMatchApp());
}

class CineMatchApp extends StatelessWidget {
  const CineMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineMatch',
      debugShowCheckedModeBanner: false,
      // Navegação por rotas nomeadas (aula de Navegação):
      // a primeira rota (principal) é nomeada com /
      routes: {
        '/': (context) => const HomeScreen(),
        '/descricao': (context) => const DescricaoScreen(),
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/busca': (context) => const BuscaScreen(),
        '/sobre': (context) => const SobreNosScreen(),
      },
    );
  }
}
