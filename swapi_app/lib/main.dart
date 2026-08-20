import 'package:flutter/material.dart';

import 'screens/busca_screen.dart';

void main() => runApp(const SwapiApp());

class SwapiApp extends StatelessWidget {
  const SwapiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWAPI — Star Wars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFC107)),
      ),
      home: const BuscaScreen(),
    );
  }
}
