import 'package:flutter/material.dart';
import '../main.dart';
import '../models/usuario.dart';

/// Tela de cadastro com campos de texto, checkboxes, radios e
/// switches. Os valores são armazenados no vetor [usuariosCadastrados].
class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  // Checkboxes: gêneros favoritos
  final Map<String, bool> _generos = {
    'Ação': false,
    'Comédia': false,
    'Drama': false,
    'Terror': false,
    'Romance': false,
    'Ficção Científica': false,
  };

  // Radio: plataforma de streaming preferida
  String _plataforma = 'Netflix';

  // Switches
  bool _receberNotificacoes = true;
  bool _perfilPublico = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    if (!_formKey.currentState!.validate()) return;

    final generosSelecionados = _generos.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    if (generosSelecionados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.vermelho,
          content: Text('Selecione pelo menos um gênero favorito!'),
        ),
      );
      return;
    }

    final email = _emailController.text.trim();
    final jaExiste = usuariosCadastrados
        .any((u) => u.email.toLowerCase() == email.toLowerCase());
    if (jaExiste) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.vermelho,
          content: Text('Este e-mail já está cadastrado!'),
        ),
      );
      return;
    }

    // Armazena os valores da tela no vetor
    usuariosCadastrados.add(
      Usuario(
        nome: _nomeController.text.trim(),
        email: email,
        senha: _senhaController.text,
        generosFavoritos: generosSelecionados,
        plataformaPreferida: _plataforma,
        receberNotificacoes: _receberNotificacoes,
        perfilPublico: _perfilPublico,
      ),
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fundoCard,
        icon: const Icon(Icons.celebration,
            color: AppColors.dourado, size: 48),
        title: const Text('Cadastro realizado!'),
        content: Text(
          'Perfil de ${_nomeController.text.trim()} criado com sucesso! 🎬\n'
          'Agora você já pode fazer login.',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('IR PARA O LOGIN'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CADASTRO')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_add_alt_1,
                  size: 64, color: AppColors.dourado),
              const SizedBox(height: 8),
              const Text(
                'Crie seu perfil cinéfilo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dourado,
                ),
              ),
              const SizedBox(height: 24),

              // Campos de texto
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome completo',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Informe o nome';
                  }
                  if (valor.trim().length < 3) {
                    return 'O nome deve ter pelo menos 3 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Informe o e-mail';
                  }
                  if (!valor.contains('@') || !valor.contains('.')) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha (mínimo 6 caracteres)',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Informe a senha';
                  }
                  if (valor.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Checkboxes — gêneros favoritos
              const _TituloSecao('🎬 Gêneros favoritos'),
              Card(
                color: AppColors.fundoCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: _generos.keys
                      .map((genero) => CheckboxListTile(
                            title: Text(genero,
                                style: const TextStyle(
                                    color: AppColors.texto)),
                            value: _generos[genero],
                            activeColor: AppColors.vermelho,
                            onChanged: (valor) => setState(
                                () => _generos[genero] = valor ?? false),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Radios — plataforma preferida
              const _TituloSecao('📺 Plataforma de streaming preferida'),
              Card(
                color: AppColors.fundoCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    'Netflix',
                    'Prime Video',
                    'Disney+',
                    'HBO Max',
                  ]
                      .map((plataforma) => RadioListTile<String>(
                            title: Text(plataforma,
                                style: const TextStyle(
                                    color: AppColors.texto)),
                            value: plataforma,
                            groupValue: _plataforma,
                            activeColor: AppColors.dourado,
                            onChanged: (valor) =>
                                setState(() => _plataforma = valor!),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Switches — preferências
              const _TituloSecao('⚙️ Preferências'),
              Card(
                color: AppColors.fundoCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Receber notificações',
                          style: TextStyle(color: AppColors.texto)),
                      subtitle: const Text(
                          'Avisos de novas recomendações',
                          style: TextStyle(
                              color: AppColors.textoSuave, fontSize: 12)),
                      value: _receberNotificacoes,
                      activeColor: AppColors.vermelho,
                      onChanged: (valor) =>
                          setState(() => _receberNotificacoes = valor),
                    ),
                    SwitchListTile(
                      title: const Text('Perfil público',
                          style: TextStyle(color: AppColors.texto)),
                      subtitle: const Text(
                          'Outros usuários podem ver suas listas',
                          style: TextStyle(
                              color: AppColors.textoSuave, fontSize: 12)),
                      value: _perfilPublico,
                      activeColor: AppColors.vermelho,
                      onChanged: (valor) =>
                          setState(() => _perfilPublico = valor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: _cadastrar,
                icon: const Icon(Icons.check),
                label: const Text('CADASTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TituloSecao extends StatelessWidget {
  final String texto;
  const _TituloSecao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.dourado,
        ),
      ),
    );
  }
}
