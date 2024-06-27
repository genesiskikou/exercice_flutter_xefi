import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercice_flutter_1/cocktail%20project/recette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import 'package:exercice_flutter_1/models.dart';
import 'package:path_provider/path_provider.dart';

class Coktailcreat extends StatefulWidget {
  const Coktailcreat({super.key});

  @override
  _CoktailcreatState createState() => _CoktailcreatState();
}

class _CoktailcreatState extends State<Coktailcreat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        title: const Text('My Createcocktails'),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: UploadLocalImageForm(
          title: 'formulaire de création de cocktail',
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class UploadLocalImageForm extends StatefulWidget {
  const UploadLocalImageForm({super.key, required this.title});

  final String title;

  @override
  State<UploadLocalImageForm> createState() => _UploadLocalImageFormState();
}

class _UploadLocalImageFormState extends State<UploadLocalImageForm> {
  String lien =
      'https://www.liquor.com/thmb/sUKZSwJj7slc5l-LDyK8eajT0LY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/very-sexy-martini-720x720-primary-b1212ebf73f54f898a56f7f0b60c0a34.jpg';
  final myControllername = TextEditingController(text: 'Nom du cocktail');
  final myControllerurl = TextEditingController(text: 'https://www.liquor.com/thmb/sUKZSwJj7slc5l-LDyK8eajT0LY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/very-sexy-martini-720x720-primary-b1212ebf73f54f898a56f7f0b60c0a34.jpg');
  final myControllerrecette = TextEditingController(text: "Réalisez la recette 'Apple fizz' au shaker. \nFrapper et servir frais.\nServir dans un verre de type 'tumbler'.\nDécorer d'un zeste de citron.");
  late List<Recette> allrecette;

  Future<void> addRecette() async {
    var box = await Hive.openBox('boxrecette');

    var recette = Recette(
        name: myControllername.text,
        recette: myControllerrecette.text,
        url: myControllerurl.text);

    box.add(recette);
    print(box.getAt(0));
  }

  Future<void> Touterecette() async {
    var box = await Hive.openBox('boxrecette');
    var recettes = box.values.toList();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('All Recettes'),
        content: SingleChildScrollView(
          child: Column(
            children: recettes.map((recette) {
              return ListTile(
                title: Text(recette.name),
                subtitle: Text(recette.recette),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  var snackBar = SnackBar(
    content: Text("votre url n'est peut etre pas bonne"),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nom du cocktail',
              ),
              controller: myControllername,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '$lien',
              ),
              controller: myControllerurl,
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                '$lien',
                height: 300,
                width: 330,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: 15,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Entrer la recette',
              ),
              controller: myControllerrecette,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (myControllerurl.text != "" &&
                            Uri.parse(myControllerurl.text).isAbsolute) {
                          setState(() {
                            lien = myControllerurl.text;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text('Upload')),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          addRecette();
                        },
                        child: Text('Créer'))),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Touterecette();
              },
              child: Text('Afficher toutes les recettes'),
            ),
          ),
        ],
      ),
    );
  }
}
