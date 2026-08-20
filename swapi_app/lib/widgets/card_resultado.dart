import 'package:flutter/material.dart';

import '../models/resultado.dart';

/// Card que exibe os cinco primeiros dados retornados pela SWAPI.
class CardResultado extends StatelessWidget {
  const CardResultado({super.key, required this.resultado});

  final Resultado resultado;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: tema.colorScheme.primaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resultado.titulo,
                  style: tema.textTheme.titleLarge?.copyWith(
                    color: tema.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${resultado.categoria.rotulo} • id ${resultado.id}',
                  style: tema.textTheme.bodySmall?.copyWith(
                    color: tema.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          for (final campo in resultado.campos)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      campo.rotulo,
                      style: tema.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(campo.valor, style: tema.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
