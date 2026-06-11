import 'package:flutter/material.dart';
import '../main.dart';

/// Tela com a descrição do projeto, usando imagens, cores e
/// widgets de formatação.
class DescricaoScreen extends StatelessWidget {
  const DescricaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOBRE O PROJETO')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner ilustrativo
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE50914),
                      Color(0xFF7A0B10),
                      Color(0xFF1A1A26),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Icon(Icons.theaters,
                          size: 40, color: Colors.white24),
                    ),
                    Positioned(
                      right: 24,
                      bottom: 16,
                      child: Icon(Icons.star,
                          size: 48, color: Colors.white24),
                    ),
                    Icon(Icons.movie_creation,
                        size: 90, color: AppColors.dourado),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'CineMatch 🎬',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: AppColors.dourado,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Seu recomendador pessoal de filmes e séries',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: AppColors.textoSuave,
              ),
            ),
            const Divider(color: AppColors.vermelho, thickness: 2, height: 36),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                    fontSize: 16, color: AppColors.texto, height: 1.6),
                children: [
                  TextSpan(
                    text: 'O CineMatch ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.vermelho),
                  ),
                  TextSpan(
                    text:
                        'é um aplicativo desenvolvido para o Projeto Integrador, '
                        'que ajuda o usuário a descobrir o que assistir. Com base no '
                        'perfil cadastrado — gêneros favoritos, plataforma de streaming '
                        'e preferências pessoais — o app recomenda filmes e séries '
                        'sob medida para cada momento.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Principais funcionalidades',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.dourado,
              ),
            ),
            const SizedBox(height: 12),
            const _ItemFuncionalidade(
              icone: Icons.recommend,
              texto: 'Recomendações baseadas nos gêneros favoritos do usuário',
            ),
            const _ItemFuncionalidade(
              icone: Icons.person,
              texto: 'Cadastro de perfil cinéfilo com preferências detalhadas',
            ),
            const _ItemFuncionalidade(
              icone: Icons.search,
              texto: 'Busca de usuários por nome, e-mail ou gênero favorito',
            ),
            const _ItemFuncionalidade(
              icone: Icons.lock,
              texto: 'Login com validação de usuários cadastrados',
            ),
            const SizedBox(height: 24),
            // Chips com os gêneros do app
            const Text(
              'Gêneros disponíveis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.dourado,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Ação 💥',
                'Comédia 😂',
                'Drama 🎭',
                'Terror 👻',
                'Romance ❤️',
                'Ficção Científica 🚀',
                'Animação 🎨',
                'Documentário 🎥',
              ]
                  .map((g) => Chip(
                        label: Text(g),
                        backgroundColor: AppColors.fundoCard,
                        labelStyle: const TextStyle(color: AppColors.texto),
                        side: const BorderSide(color: AppColors.vermelho),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                icon: const Icon(Icons.rocket_launch),
                label: const Text('COMEÇAR AGORA'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemFuncionalidade extends StatelessWidget {
  final IconData icone;
  final String texto;

  const _ItemFuncionalidade({required this.icone, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icone, color: AppColors.vermelho, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(color: AppColors.texto, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
