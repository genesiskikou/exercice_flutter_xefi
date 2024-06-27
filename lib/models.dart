// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exercice_flutter_1/cocktail%20project/coktailcreat.dart';
import 'package:exercice_flutter_1/cocktail%20project/homecocktail.dart';
import 'package:exercice_flutter_1/cocktail%20project/listcreatecocktail.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ButtonModels extends StatelessWidget {
  ButtonModels(
      {super.key,
      required this.background,
      required this.colorborder,
      required this.colortexte,
      required this.texte});

  String texte;
  Color colorborder;
  Color background;
  Color colortexte;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(color: colorborder),
          padding: const EdgeInsets.all(2),
        ),
        onPressed: () {},
        child: Text(
          texte.toUpperCase(),
          style: TextStyle(
            color: colortexte,
          ),
        ),
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  final Function()? onMenuPressed;
  final Function()? onSearchPressed;
  final Function()? onaddPressed;

  const CustomBottomAppBar({
    Key? key,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onaddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onMenuPressed,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchPressed,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onaddPressed,
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function()? onMenuPressed;
  final Function()? onSearchPressed;
  final Function()? onaddPressed;

  const CustomDrawer({
    Key? key,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onaddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 253, 253, 253),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomepageCocktail()),
              );},
          ),
          ListTile(
            title: const Text('create cocktail'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Coktailcreat()),
              );
            },
          ),
           ListTile(
            title: const Text('My Create Cocktails'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListCreateCocktail()),
              );
            },
          ),
        ],
      ),
    );
  }
}



class CardExample extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CardExample({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    width: 275,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}