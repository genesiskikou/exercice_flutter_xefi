import 'package:exercice_flutter_1/cocktail%20project/coktailcreat.dart';
import 'package:exercice_flutter_1/cocktail%20project/homecocktail.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Coktailcreat(),
    );
  }
}
