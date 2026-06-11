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

/// Paleta de cores do tema "cinema".
class AppColors {
  static const Color fundo = Color(0xFF0D0D14); // preto azulado
  static const Color fundoCard = Color(0xFF1A1A26);
  static const Color vermelho = Color(0xFFE50914); // vermelho cinema
  static const Color dourado = Color(0xFFFFC857); // dourado premiação
  static const Color texto = Color(0xFFF2F2F2);
  static const Color textoSuave = Color(0xFFB0B0C0);
}

class CineMatchApp extends StatelessWidget {
  const CineMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.fundo,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.vermelho,
          secondary: AppColors.dourado,
          surface: AppColors.fundoCard,
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.dourado,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          iconTheme: IconThemeData(color: AppColors.texto),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.vermelho,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.fundoCard,
          labelStyle: const TextStyle(color: AppColors.textoSuave),
          prefixIconColor: AppColors.dourado,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.vermelho, width: 2),
          ),
        ),
      ),
      initialRoute: '/',
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
