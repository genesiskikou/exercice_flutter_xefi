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

class listAvatarbar extends StatelessWidget {
  final String lien;
  const listAvatarbar({
    super.key,
    required this.lien,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: ClipOval(
                  child: Image.network(
                "$lien",
                fit: BoxFit.cover,
                width: 90.0,
                height: 90.0,
              )),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                'Martini',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Recette avec alcool ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
