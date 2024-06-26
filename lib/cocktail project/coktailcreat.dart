// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final _formKey = GlobalKey<FormState>();
  final myControllername = TextEditingController();
  final myControllerurl = TextEditingController();
  final myControllerrecette = TextEditingController();
  late List<Recette> allrecette;

  // late Future<BoxCollection> collection = BoxCollection.open(
  //   'boxrecette',
  //   {'recette'},
  //   path: Directory.current.path,
  // );

  Future<void> addRecette() async {
    var box = await Hive.openBox('boxrecette');

    var recette = Recette(
        name: myControllername.text,
        recette: myControllerrecette.text,
        url: myControllerurl.text);

    box.add(recette);
    // ignore: avoid_print
    print(box.getAt(0));
  }

  var snackBar = SnackBar(
    content: Text("votre url n'est peut etre pas bonne"),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
          )
        ],
      ),
    );
  }
}
