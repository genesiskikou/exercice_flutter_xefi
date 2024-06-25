import 'package:exercice_flutter_1/cocktail%20project/cocktailapi.dart';
import 'package:exercice_flutter_1/quantite.dart';
import 'package:flutter/material.dart';
import 'package:exercice_flutter_1/cardnotedefrais.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Cardnotedefrais(),
    );
  }
}
