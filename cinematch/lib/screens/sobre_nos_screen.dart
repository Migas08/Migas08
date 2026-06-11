import 'package:flutter/material.dart';
import '../main.dart';

/// Tela "Sobre Nós" com fotos (avatares) e informações
/// sobre os desenvolvedores.
class SobreNosScreen extends StatelessWidget {
  const SobreNosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOBRE NÓS')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.groups, size: 72, color: AppColors.dourado),
            const SizedBox(height: 8),
            const Text(
              'Equipe CineMatch',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: AppColors.dourado,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Os cinéfilos por trás do projeto 🎬',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textoSuave,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 28),
            // ⚠️ Substitua os dados abaixo pelos integrantes reais do grupo.
            // Para usar fotos reais, troque o `icone` por:
            //   backgroundImage: AssetImage('assets/images/foto.jpg')
            const _CardDesenvolvedor(
              nome: 'Miguel',
              funcao: 'Desenvolvedor & Líder do Projeto',
              descricao:
                  'Responsável pela arquitetura do app e pelas telas de '
                  'login e cadastro. Fã de ficção científica.',
              filmeFavorito: 'Interestelar',
              icone: Icons.code,
              cor: AppColors.vermelho,
            ),
            const _CardDesenvolvedor(
              nome: 'Integrante 2',
              funcao: 'Designer de Interface',
              descricao:
                  'Criou a identidade visual do CineMatch, escolhendo as '
                  'cores e o estilo inspirado nas salas de cinema.',
              filmeFavorito: 'O Poderoso Chefão',
              icone: Icons.palette,
              cor: AppColors.dourado,
            ),
            const _CardDesenvolvedor(
              nome: 'Integrante 3',
              funcao: 'Desenvolvedor Back-end',
              descricao:
                  'Implementou a lógica de busca e o armazenamento dos '
                  'usuários no vetor. Maratonista de séries.',
              filmeFavorito: 'Matrix',
              icone: Icons.storage,
              cor: Colors.lightBlueAccent,
            ),
            const SizedBox(height: 24),
            Card(
              color: AppColors.fundoCard,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.dourado),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.school, color: AppColors.dourado, size: 36),
                    SizedBox(height: 8),
                    Text(
                      'Projeto Integrador',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.texto,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Aplicativo desenvolvido em Flutter como trabalho '
                      'acadêmico, aplicando navegação, formulários, '
                      'validação e armazenamento de dados em vetor.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.textoSuave, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardDesenvolvedor extends StatelessWidget {
  final String nome;
  final String funcao;
  final String descricao;
  final String filmeFavorito;
  final IconData icone;
  final Color cor;

  const _CardDesenvolvedor({
    required this.nome,
    required this.funcao,
    required this.descricao,
    required this.filmeFavorito,
    required this.icone,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fundoCard,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cor.withOpacity(0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: cor.withOpacity(0.15),
              child: Icon(icone, size: 42, color: cor),
            ),
            const SizedBox(height: 12),
            Text(
              nome,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.texto,
              ),
            ),
            Text(
              funcao,
              style: TextStyle(
                fontSize: 14,
                color: cor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              descricao,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.textoSuave, height: 1.5),
            ),
            const SizedBox(height: 12),
            Chip(
              avatar: const Icon(Icons.favorite,
                  size: 16, color: AppColors.vermelho),
              label: Text('Filme favorito: $filmeFavorito'),
              backgroundColor: AppColors.fundo,
              labelStyle:
                  const TextStyle(color: AppColors.texto, fontSize: 13),
              side: BorderSide(color: cor.withOpacity(0.4)),
            ),
          ],
        ),
      ),
    );
  }
}
