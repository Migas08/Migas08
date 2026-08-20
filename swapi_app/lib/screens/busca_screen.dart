import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/categoria.dart';
import '../models/resultado.dart';
import '../services/swapi_service.dart';
import '../widgets/card_resultado.dart';

/// Tela principal: campo de texto para o id, Radio para a categoria e o
/// resultado da busca na SWAPI.
class BuscaScreen extends StatefulWidget {
  const BuscaScreen({super.key});

  @override
  State<BuscaScreen> createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _service = SwapiService();

  Categoria _categoria = Categoria.pessoa;
  Resultado? _resultado;
  String? _erro;
  bool _carregando = false;

  @override
  void dispose() {
    _idController.dispose();
    _service.dispose();
    super.dispose();
  }

  Future<void> _buscar() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    final id = int.parse(_idController.text.trim());

    setState(() {
      _carregando = true;
      _erro = null;
      _resultado = null;
    });

    try {
      final resultado = await _service.buscar(_categoria, id);
      if (!mounted) return;
      setState(() => _resultado = resultado);
    } on SwapiException catch (e) {
      if (!mounted) return;
      setState(() => _erro = e.mensagem);
    } finally {
      if (mounted) setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SWAPI — Star Wars'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _idController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Id',
                  hintText: 'Informe o id que deseja buscar (ex.: 1)',
                  prefixIcon: Icon(Icons.tag),
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (_) => _buscar(),
                validator: (valor) {
                  final texto = valor?.trim() ?? '';
                  if (texto.isEmpty) return 'Informe um id.';
                  final id = int.tryParse(texto);
                  if (id == null || id <= 0) {
                    return 'Informe um número inteiro maior que zero.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('Categoria', style: tema.textTheme.titleMedium),
            for (final categoria in Categoria.values)
              RadioListTile<Categoria>(
                title: Text(categoria.rotulo),
                value: categoria,
                groupValue: _categoria,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: _carregando
                    ? null
                    : (valor) => setState(() => _categoria = valor!),
              ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _carregando ? null : _buscar,
              icon: const Icon(Icons.search),
              label: const Text('Buscar'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 24),
            if (_carregando)
              const Center(child: CircularProgressIndicator())
            else if (_erro != null)
              _MensagemErro(mensagem: _erro!)
            else if (_resultado != null)
              CardResultado(resultado: _resultado!)
            else
              Center(
                child: Text(
                  'Informe um id, escolha a categoria e toque em Buscar.',
                  textAlign: TextAlign.center,
                  style: tema.textTheme.bodyMedium?.copyWith(
                    color: tema.colorScheme.outline,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MensagemErro extends StatelessWidget {
  const _MensagemErro({required this.mensagem});

  final String mensagem;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: tema.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: tema.colorScheme.onErrorContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              mensagem,
              style: TextStyle(color: tema.colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
