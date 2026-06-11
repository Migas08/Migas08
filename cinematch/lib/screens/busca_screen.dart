import 'package:flutter/material.dart';
import '../main.dart';
import '../models/usuario.dart';

/// Tela de busca: pesquisa usuários cadastrados no vetor por
/// nome, e-mail ou gênero favorito e exibe os resultados.
class BuscaScreen extends StatefulWidget {
  const BuscaScreen({super.key});

  @override
  State<BuscaScreen> createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  final _buscaController = TextEditingController();
  String _atributo = 'Nome';
  List<Usuario> _resultados = [];
  bool _buscou = false;

  @override
  void initState() {
    super.initState();
    // Mostra todos os usuários ao abrir a tela
    _resultados = List.from(usuariosCadastrados);
  }

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  void _buscar() {
    final termo = _buscaController.text.trim().toLowerCase();
    setState(() {
      _buscou = true;
      if (termo.isEmpty) {
        _resultados = List.from(usuariosCadastrados);
        return;
      }
      _resultados = usuariosCadastrados.where((u) {
        switch (_atributo) {
          case 'Nome':
            return u.nome.toLowerCase().contains(termo);
          case 'E-mail':
            return u.email.toLowerCase().contains(termo);
          case 'Gênero favorito':
            return u.generosFavoritos
                .any((g) => g.toLowerCase().contains(termo));
          case 'Plataforma':
            return u.plataformaPreferida.toLowerCase().contains(termo);
          default:
            return false;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BUSCAR USUÁRIOS')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Seleção do atributo de busca
            DropdownButtonFormField<String>(
              value: _atributo,
              dropdownColor: AppColors.fundoCard,
              decoration: const InputDecoration(
                labelText: 'Buscar por',
                prefixIcon: Icon(Icons.filter_list),
              ),
              items: ['Nome', 'E-mail', 'Gênero favorito', 'Plataforma']
                  .map((a) => DropdownMenuItem(value: a, child: Text(a)))
                  .toList(),
              onChanged: (valor) => setState(() => _atributo = valor!),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _buscaController,
                    decoration: InputDecoration(
                      labelText: 'Digite o termo de busca',
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onSubmitted: (_) => _buscar(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _buscar,
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '${_resultados.length} usuário(s) encontrado(s)',
              style: const TextStyle(
                color: AppColors.dourado,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _resultados.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.movie_filter_outlined,
                              size: 64, color: AppColors.textoSuave),
                          const SizedBox(height: 12),
                          Text(
                            _buscou
                                ? 'Nenhum usuário encontrado 😢'
                                : 'Nenhum usuário cadastrado ainda',
                            style: const TextStyle(
                                color: AppColors.textoSuave, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _resultados.length,
                      itemBuilder: (context, indice) {
                        final usuario = _resultados[indice];
                        return Card(
                          color: AppColors.fundoCard,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                                color:
                                    AppColors.vermelho.withOpacity(0.3)),
                          ),
                          child: ExpansionTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  AppColors.vermelho.withOpacity(0.2),
                              child: Text(
                                usuario.nome[0].toUpperCase(),
                                style: const TextStyle(
                                  color: AppColors.dourado,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              usuario.nome,
                              style: const TextStyle(
                                color: AppColors.texto,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              usuario.email,
                              style: const TextStyle(
                                  color: AppColors.textoSuave,
                                  fontSize: 13),
                            ),
                            iconColor: AppColors.dourado,
                            collapsedIconColor: AppColors.textoSuave,
                            childrenPadding: const EdgeInsets.fromLTRB(
                                20, 0, 20, 16),
                            children: [
                              _LinhaInfo(
                                icone: Icons.movie,
                                rotulo: 'Gêneros',
                                valor:
                                    usuario.generosFavoritos.join(', '),
                              ),
                              _LinhaInfo(
                                icone: Icons.tv,
                                rotulo: 'Plataforma',
                                valor: usuario.plataformaPreferida,
                              ),
                              _LinhaInfo(
                                icone: Icons.notifications,
                                rotulo: 'Notificações',
                                valor: usuario.receberNotificacoes
                                    ? 'Ativadas'
                                    : 'Desativadas',
                              ),
                              _LinhaInfo(
                                icone: Icons.public,
                                rotulo: 'Perfil',
                                valor: usuario.perfilPublico
                                    ? 'Público'
                                    : 'Privado',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinhaInfo extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final String valor;

  const _LinhaInfo({
    required this.icone,
    required this.rotulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icone, size: 18, color: AppColors.dourado),
          const SizedBox(width: 8),
          Text('$rotulo: ',
              style: const TextStyle(
                  color: AppColors.textoSuave,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(valor,
                style: const TextStyle(color: AppColors.texto)),
          ),
        ],
      ),
    );
  }
}
