import 'package:flutter/material.dart';

// Tela com a descrição do projeto, usando imagens, cores
// e widgets de formatação (Text, Container, Icon, Row, Column).
class DescricaoScreen extends StatelessWidget {
  const DescricaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE50914),
        title: const Text('Sobre o Projeto',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // imagem ilustrativa do tema
              Center(
                child: Image.network(
                  'https://picsum.photos/seed/filmes/400/180',
                  width: 400,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'CineMatch 🎬',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Seu recomendador de filmes e séries',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'O CineMatch é um aplicativo desenvolvido para o Projeto '
                'Integrador que ajuda o usuário a descobrir o que assistir. '
                'Com base no perfil cadastrado — gêneros favoritos, plataforma '
                'de streaming e preferências — o app recomenda filmes e séries '
                'sob medida para cada momento.',
                style: TextStyle(fontSize: 16, color: Colors.white, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                'Funcionalidades:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC857),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.movie, color: Color(0xFFE50914)),
                  SizedBox(width: 10),
                  Text('Recomendações por gênero favorito',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.person, color: Color(0xFFE50914)),
                  SizedBox(width: 10),
                  Text('Cadastro de perfil cinéfilo',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.search, color: Color(0xFFE50914)),
                  SizedBox(width: 10),
                  Text('Busca de usuários cadastrados',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.lock, color: Color(0xFFE50914)),
                  SizedBox(width: 10),
                  Text('Login com validação de usuários',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 20),
              // destaque com Container e BoxDecoration
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFC857)),
                ),
                child: const Text(
                  'Gêneros disponíveis: Ação 💥  Comédia 😂  Drama 🎭  '
                  'Terror 👻  Romance ❤️  Ficção Científica 🚀',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(height: 24),
              // botão voltar, além da seta da AppBar
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE50914),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('VOLTAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
