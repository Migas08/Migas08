import 'package:flutter/material.dart';
import 'my_api.dart';

void main() => runApp(const MaterialApp(home: TelaBusca()));

class TelaBusca extends StatefulWidget {
  const TelaBusca({super.key});

  @override
  State<TelaBusca> createState() => _TelaBuscaState();
}

class _TelaBuscaState extends State<TelaBusca> {
  final _idController = TextEditingController();
  String _categoria = 'people';
  Map<String, dynamic>? _dados;
  String _mensagem = '';

  Future<void> _buscar() async {
    setState(() {
      _dados = null;
      _mensagem = 'Buscando...';
    });

    final resultado = await MyApi.buscar(_categoria, _idController.text);

    setState(() {
      _dados = resultado;
      _mensagem = resultado == null ? 'Não encontrado.' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SWAPI - Star Wars')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Id',
                border: OutlineInputBorder(),
              ),
            ),
            RadioListTile(
              title: const Text('Pessoa'),
              value: 'people',
              groupValue: _categoria,
              onChanged: (v) => setState(() => _categoria = v!),
            ),
            RadioListTile(
              title: const Text('Planeta'),
              value: 'planets',
              groupValue: _categoria,
              onChanged: (v) => setState(() => _categoria = v!),
            ),
            RadioListTile(
              title: const Text('Nave'),
              value: 'starships',
              groupValue: _categoria,
              onChanged: (v) => setState(() => _categoria = v!),
            ),
            ElevatedButton(
              onPressed: _buscar,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            Text(_mensagem),
            if (_dados != null)
              for (final campo in _dados!.entries)
                Text('${campo.key}: ${campo.value}',
                    style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
