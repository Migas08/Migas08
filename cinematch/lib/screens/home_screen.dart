import 'package:flutter/material.dart';
import '../main.dart';

/// Tela inicial com links (cards/botões) para as demais páginas.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              // Logo do app
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2B0A0E), Color(0xFF1A1A26)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.dourado, width: 1),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.local_movies,
                        size: 72, color: AppColors.vermelho),
                    const SizedBox(height: 12),
                    Text(
                      'CineMatch',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        color: AppColors.dourado,
                        shadows: [
                          Shadow(
                            color: AppColors.vermelho.withOpacity(0.6),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'O filme certo para o seu momento 🍿',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textoSuave,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'MENU PRINCIPAL',
                style: TextStyle(
                  color: AppColors.textoSuave,
                  fontSize: 13,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icone: Icons.movie_filter,
                titulo: 'Sobre o Projeto',
                subtitulo: 'Conheça a proposta do CineMatch',
                cor: AppColors.dourado,
                rota: '/descricao',
              ),
              _MenuCard(
                icone: Icons.login,
                titulo: 'Login',
                subtitulo: 'Acesse sua conta',
                cor: AppColors.vermelho,
                rota: '/login',
              ),
              _MenuCard(
                icone: Icons.person_add_alt_1,
                titulo: 'Cadastro',
                subtitulo: 'Crie seu perfil cinéfilo',
                cor: Colors.orangeAccent,
                rota: '/cadastro',
              ),
              _MenuCard(
                icone: Icons.search,
                titulo: 'Buscar Usuários',
                subtitulo: 'Pesquise entre os cadastrados',
                cor: Colors.lightBlueAccent,
                rota: '/busca',
              ),
              _MenuCard(
                icone: Icons.groups,
                titulo: 'Sobre Nós',
                subtitulo: 'Conheça os desenvolvedores',
                cor: Colors.greenAccent,
                rota: '/sobre',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String subtitulo;
  final Color cor;
  final String rota;

  const _MenuCard({
    required this.icone,
    required this.titulo,
    required this.subtitulo,
    required this.cor,
    required this.rota,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fundoCard,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cor.withOpacity(0.35)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: cor.withOpacity(0.15),
          child: Icon(icone, color: cor),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: AppColors.texto,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          subtitulo,
          style: const TextStyle(color: AppColors.textoSuave, fontSize: 13),
        ),
        trailing: Icon(Icons.chevron_right, color: cor),
        onTap: () => Navigator.pushNamed(context, rota),
      ),
    );
  }
}
