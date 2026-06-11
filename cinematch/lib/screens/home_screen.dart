import 'package:flutter/material.dart';

// Tela inicial: links (imagens com GestureDetector e botões)
// para as demais páginas, com navegação por rotas nomeadas.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE50914),
        title: const Text(
          'CineMatch 🎬',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // imagem do tema, clicável (GestureDetector) -> Sobre o Projeto
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/descricao');
                },
                child: Image.network(
                  'https://picsum.photos/seed/cinema/400/180',
                  width: 400,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'O filme certo para o seu momento 🍿\n(toque na imagem para saber mais)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFC857),
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              // botões de navegação para as demais páginas
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC857),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/descricao');
                  },
                  child: const Text('SOBRE O PROJETO'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE50914),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('LOGIN'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: const Text('CADASTRO'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/busca');
                  },
                  child: const Text('BUSCAR USUÁRIOS'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sobre');
                  },
                  child: const Text('SOBRE NÓS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
