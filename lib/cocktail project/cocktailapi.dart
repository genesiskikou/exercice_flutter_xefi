import 'dart:convert';
import 'package:http/http.dart' as http;

class Cocktail {
  final String name;
  final String instructions;
  final String imageUrl;

  Cocktail({required this.name, required this.instructions, required this.imageUrl});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      instructions: json['strInstructions'],
      imageUrl: json['strDrinkThumb'],
    );
  }
}

class CocktailApi {
  static const String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  Future<Cocktail> fetchRandomCocktail() async {
    final response = await http.get(Uri.parse('${baseUrl}random.php'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Cocktail.fromJson(json['drinks'][0]);
    } else {
      throw Exception('Failed to load cocktail');
    }
  }

  Future<List<Cocktail>> fetchMultipleRandomCocktails(int count) async {
    List<Cocktail> cocktails = [];
    for (int i = 0; i < count; i++) {
      cocktails.add(await fetchRandomCocktail());
    }
    return cocktails;
  }
}
