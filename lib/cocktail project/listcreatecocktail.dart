import 'package:exercice_flutter_1/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:exercice_flutter_1/cocktail%20project/recette.dart';

class ListCreateCocktail extends StatelessWidget {
  Future<Box<Recette>> openBox() async {
    return await Hive.openBox<Recette>('boxrecette');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des cocktails créés'),
      ),
      body: FutureBuilder<Box<Recette>>(
        future: openBox(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var box = snapshot.data!;
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final recette = box.getAt(index) as Recette;
                return Padding(padding: const EdgeInsets.all(16.0), child: ListTile(
                  
                  trailing: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: ClipOval(
                  child: Image.network(
                recette.url,
                fit: BoxFit.cover,
                width: 90.0,
                height: 90.0,
              )),
            ),
                  title: Text(recette.name),
                ),) ;
              },
            );
          }
        },
      ),
    );
  }
}
