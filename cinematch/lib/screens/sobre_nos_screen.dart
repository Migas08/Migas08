import 'package:flutter/material.dart';

// Tela "Sobre Nós" com fotos (Image.network) e informações
// sobre os desenvolvedores.
class SobreNosScreen extends StatelessWidget {
  const SobreNosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE50914),
        title: const Text('Sobre Nós', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Equipe CineMatch 🎬',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC857),
                ),
              ),
              const Text(
                'Os cinéfilos por trás do projeto',
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),

              // ⚠️ Troque os nomes e as fotos pelos integrantes reais do grupo
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE50914)),
                ),
                child: Column(
                  children: [
                    // foto redonda usando Container com BoxShape.circle
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/seed/dev1/200'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Miguel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Desenvolvedor e líder do projeto',
                      style: TextStyle(color: Color(0xFFFFC857)),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Responsável pelas telas de login e cadastro. '
                      'Fã de ficção científica. 🚀\nFilme favorito: Interestelar',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFC857)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/seed/dev2/200'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Integrante 2',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Designer de interface',
                      style: TextStyle(color: Color(0xFFFFC857)),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Criou a identidade visual do CineMatch, inspirada '
                      'nas salas de cinema. 🎨\nFilme favorito: O Poderoso Chefão',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A26),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.lightBlue),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/seed/dev3/200'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Integrante 3',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Desenvolvedor',
                      style: TextStyle(color: Color(0xFFFFC857)),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Implementou a busca e o armazenamento dos usuários '
                      'no vetor. 📺\nFilme favorito: Matrix',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('VOLTAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
