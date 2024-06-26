import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercice_flutter_1/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:exercice_flutter_1/cocktail project/coktailcreat.dart';

class Listcreatecocktail extends StatefulWidget {
  const Listcreatecocktail({super.key});

  @override
  _ListcreatecocktailState createState() => _ListcreatecocktailState();
}

class _ListcreatecocktailState extends State<Listcreatecocktail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        title: const Text('My Createcocktails'),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class affichelist extends StatefulWidget {
  const affichelist({super.key, required this.title});

  final String title;

  @override
  State<affichelist> createState() => _affichelistState();
}

class _affichelistState extends State<affichelist> {
  get lien => null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.network(
        '$lien',
        height: 300,
        width: 275,
        fit: BoxFit.cover,
      ),
    );
  }
}
