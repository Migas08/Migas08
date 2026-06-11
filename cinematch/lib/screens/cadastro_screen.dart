import 'package:flutter/material.dart';
import '../models/usuario.dart';

// Tela de cadastro com TextFormFields, checkboxes, radios e switches.
// Os valores obtidos da tela são armazenados no vetor usuariosCadastrados.
class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  // controllers dos campos de texto
  final campoNome = TextEditingController();
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();

  // checkboxes - gêneros favoritos (variáveis bool, como na aula)
  bool acao = false;
  bool comedia = false;
  bool drama = false;
  bool terror = false;
  bool romance = false;
  bool ficcao = false;

  // radio - plataforma de streaming preferida
  String plataforma = 'Netflix';

  // switches - preferências
  bool notificacoes = true;
  bool perfilPublico = false;

  // método que mostra no console os elementos cadastrados (aula)
  void mostrarCadastrados() {
    for (int i = 0; i < usuariosCadastrados.length; i++) {
      print('Nome: ${usuariosCadastrados[i].nome} | '
          'E-mail: ${usuariosCadastrados[i].email} | '
          'Gêneros: ${usuariosCadastrados[i].generos} | '
          'Plataforma: ${usuariosCadastrados[i].plataforma} | '
          'Notificações: ${usuariosCadastrados[i].notificacoes} | '
          'Perfil público: ${usuariosCadastrados[i].perfilPublico}');
    }
  }

  void cadastrar() {
    if (_formKey.currentState!.validate()) {
      // monta a String de gêneros a partir dos checkboxes
      String generos = '';
      if (acao) generos += 'Ação, ';
      if (comedia) generos += 'Comédia, ';
      if (drama) generos += 'Drama, ';
      if (terror) generos += 'Terror, ';
      if (romance) generos += 'Romance, ';
      if (ficcao) generos += 'Ficção Científica, ';
      if (generos.isEmpty) {
        generos = 'Nenhum';
      } else {
        generos = generos.substring(0, generos.length - 2);
      }

      // armazena os valores da tela no vetor (List.add)
      usuariosCadastrados.add(Usuario(
        campoNome.text,
        campoEmail.text,
        campoSenha.text,
        generos,
        plataforma,
        notificacoes,
        perfilPublico,
      ));

      mostrarCadastrados();

      // mensagem de sucesso em uma SnackBar (como na aula)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário cadastrado com sucesso! 🎬'),
          backgroundColor: Colors.green,
        ),
      );

      // limpa os campos após cadastrar
      campoNome.clear();
      campoEmail.clear();
      campoSenha.clear();
      _formKey.currentState!.reset();
      setState(() {
        acao = false;
        comedia = false;
        drama = false;
        terror = false;
        romance = false;
        ficcao = false;
        plataforma = 'Netflix';
        notificacoes = true;
        perfilPublico = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE50914),
        title: const Text('Cadastro', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Crie seu perfil cinéfilo 🍿',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC857),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: campoNome,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    icon: const Icon(Icons.person, color: Color(0xFFFFC857)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'O campo nome não pode ser vazio';
                    }
                    if (valor.length < 3) {
                      return 'O nome deve ter pelo menos 3 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: campoEmail,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    icon: const Icon(Icons.email, color: Color(0xFFFFC857)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'O campo e-mail não pode ser vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: campoSenha,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    icon: const Icon(Icons.lock, color: Color(0xFFFFC857)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'O campo senha não pode ser vazio';
                    }
                    if (valor.length < 3) {
                      return 'A senha não pode ter menos que 3 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // CheckboxListTile - gêneros favoritos
                const Text(
                  '🎬 Gêneros favoritos:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Ação',
                      style: TextStyle(color: Colors.white)),
                  value: acao,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool? valor) {
                    setState(() {
                      acao = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Comédia',
                      style: TextStyle(color: Colors.white)),
                  value: comedia,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool? valor) {
                    setState(() {
                      comedia = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Drama',
                      style: TextStyle(color: Colors.white)),
                  value: drama,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool? valor) {
                    setState(() {
                      drama = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Terror',
                      style: TextStyle(color: Colors.white)),
                  value: terror,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool? valor) {
                    setState(() {
                      terror = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Romance',
                      style: TextStyle(color: Colors.white)),
                  value: romance,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool? valor) {
                    setState(() {
                      romance = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Ficção Científica',
                      style: TextStyle(color: Colors.white)),
                  value: ficcao,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool? valor) {
                    setState(() {
                      ficcao = valor!;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // RadioListTile - plataforma preferida
                const Text(
                  '📺 Plataforma preferida:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
                RadioListTile<String>(
                  title: const Text('Netflix',
                      style: TextStyle(color: Colors.white)),
                  value: 'Netflix',
                  groupValue: plataforma,
                  activeColor: const Color(0xFFFFC857),
                  onChanged: (String? valor) {
                    setState(() {
                      plataforma = valor!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Prime Video',
                      style: TextStyle(color: Colors.white)),
                  value: 'Prime Video',
                  groupValue: plataforma,
                  activeColor: const Color(0xFFFFC857),
                  onChanged: (String? valor) {
                    setState(() {
                      plataforma = valor!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Disney+',
                      style: TextStyle(color: Colors.white)),
                  value: 'Disney+',
                  groupValue: plataforma,
                  activeColor: const Color(0xFFFFC857),
                  onChanged: (String? valor) {
                    setState(() {
                      plataforma = valor!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('HBO Max',
                      style: TextStyle(color: Colors.white)),
                  value: 'HBO Max',
                  groupValue: plataforma,
                  activeColor: const Color(0xFFFFC857),
                  onChanged: (String? valor) {
                    setState(() {
                      plataforma = valor!;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // SwitchListTile - preferências
                const Text(
                  '⚙️ Preferências:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC857),
                  ),
                ),
                SwitchListTile(
                  title: const Text('Receber notificações',
                      style: TextStyle(color: Colors.white)),
                  value: notificacoes,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool valor) {
                    setState(() {
                      notificacoes = valor;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Perfil público',
                      style: TextStyle(color: Colors.white)),
                  value: perfilPublico,
                  activeColor: const Color(0xFFE50914),
                  onChanged: (bool valor) {
                    setState(() {
                      perfilPublico = valor;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE50914),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: cadastrar,
                        child: const Text('CADASTRAR'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
