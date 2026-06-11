import 'package:flutter/material.dart';
import '../models/usuario.dart';

// Tela de busca: pesquisa por determinado atributo (escolhido com
// RadioListTile) e mostra os dados cadastrados no vetor.
class BuscaScreen extends StatefulWidget {
  const BuscaScreen({super.key});

  @override
  State<BuscaScreen> createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  // controller para manipular o conteúdo do TextField
  final campoBusca = TextEditingController();

  // atributo escolhido para a busca (radio)
  String atributo = 'Nome';

  // vetor com os resultados da busca
  List<Usuario> resultados = [];

  @override
  void initState() {
    super.initState();
    // ao abrir a tela, mostra todos os usuários cadastrados
    resultados = usuariosCadastrados;
  }

  void buscar() {
    String termo = campoBusca.text.toLowerCase();
    List<Usuario> encontrados = [];

    // percorre o vetor procurando pelo atributo escolhido
    for (int i = 0; i < usuariosCadastrados.length; i++) {
      Usuario u = usuariosCadastrados[i];
      if (atributo == 'Nome' && u.nome.toLowerCase().contains(termo)) {
        encontrados.add(u);
      } else if (atributo == 'E-mail' &&
          u.email.toLowerCase().contains(termo)) {
        encontrados.add(u);
      } else if (atributo == 'Gênero' &&
          u.generos.toLowerCase().contains(termo)) {
        encontrados.add(u);
      } else if (atributo == 'Plataforma' &&
          u.plataforma.toLowerCase().contains(termo)) {
        encontrados.add(u);
      }
    }

    // redesenha a tela com os resultados (setState)
    setState(() {
      resultados = encontrados;
    });
  }

  // monta a lista de widgets com os dados de cada usuário encontrado
  List<Widget> montarResultados() {
    List<Widget> lista = [];
    for (int i = 0; i < resultados.length; i++) {
      Usuario u = resultados[i];
      lista.add(
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A26),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE50914)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🎬 ${u.nome}',
                style: const TextStyle(
                  color: Color(0xFFFFC857),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('E-mail: ${u.email}',
                  style: const TextStyle(color: Colors.white)),
              Text('Gêneros: ${u.generos}',
                  style: const TextStyle(color: Colors.white)),
              Text('Plataforma: ${u.plataforma}',
                  style: const TextStyle(color: Colors.white)),
              Text(
                  'Notificações: ${u.notificacoes ? "Ativadas" : "Desativadas"}',
                  style: const TextStyle(color: Colors.white)),
              Text('Perfil: ${u.perfilPublico ? "Público" : "Privado"}',
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      );
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE50914),
        title: const Text('Buscar Usuários',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buscar por:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC857),
                ),
              ),
              // radios para escolher o atributo da busca
              RadioListTile<String>(
                title:
                    const Text('Nome', style: TextStyle(color: Colors.white)),
                value: 'Nome',
                groupValue: atributo,
                activeColor: const Color(0xFFFFC857),
                onChanged: (String? valor) {
                  setState(() {
                    atributo = valor!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('E-mail',
                    style: TextStyle(color: Colors.white)),
                value: 'E-mail',
                groupValue: atributo,
                activeColor: const Color(0xFFFFC857),
                onChanged: (String? valor) {
                  setState(() {
                    atributo = valor!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Gênero',
                    style: TextStyle(color: Colors.white)),
                value: 'Gênero',
                groupValue: atributo,
                activeColor: const Color(0xFFFFC857),
                onChanged: (String? valor) {
                  setState(() {
                    atributo = valor!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Plataforma',
                    style: TextStyle(color: Colors.white)),
                value: 'Plataforma',
                groupValue: atributo,
                activeColor: const Color(0xFFFFC857),
                onChanged: (String? valor) {
                  setState(() {
                    atributo = valor!;
                  });
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: campoBusca,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Digite o termo de busca',
                  icon: const Icon(Icons.search, color: Color(0xFFFFC857)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE50914),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: buscar,
                      child: const Text('BUSCAR'),
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${resultados.length} usuário(s) encontrado(s):',
                style: const TextStyle(
                  color: Color(0xFFFFC857),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              // mostra os dados cadastrados no vetor
              Column(
                children: montarResultados(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
