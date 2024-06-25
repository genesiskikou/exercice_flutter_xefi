import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CocktailOfTheDay extends StatefulWidget {
  const CocktailOfTheDay({super.key});
  @override
  _CocktailOfTheDayState createState() => _CocktailOfTheDayState();
}

Future<String> _geturl() async {
  // Construction de l'URL a appeler
  var url = 'www.thecocktaildb.com/api/json/v1/1/random.php';
  // Appel
  var response = await http.get(url as Uri);
  // ignore: avoid_print
  print('Response status: ${response.statusCode}');
  // ignore: avoid_print
  print('Response body: ${response.body}');
  return response.body;
}

class _CocktailOfTheDayState extends State<CocktailOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cocktail of the Day'),
        ),
        body: null);
  }
}
