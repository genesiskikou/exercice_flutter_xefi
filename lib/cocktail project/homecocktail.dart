import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercice_flutter_1/models.dart';
import 'package:flutter/material.dart';

class HomepageCocktail extends StatefulWidget {
  const HomepageCocktail({super.key});

  @override
  _HomepageCocktailState createState() => _HomepageCocktailState();
}

class _HomepageCocktailState extends State<HomepageCocktail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Les recettes de cocktails",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return const CardExample();
                  },
                );
              }).toList(),
            ),
            Text(
              "Les bars disponibles",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            listAvatarbar(
              lien:
                  "https://images.pexels.com/photos/941864/pexels-photo-941864.jpeg?cs=srgb&dl=pexels-chanwalrus-941864.jpg&fm=jpg",
            ),
            listAvatarbar(
              lien:
                  "https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg",
            ),
            listAvatarbar(
              lien:
                  "https://images.pexels.com/photos/941864/pexels-photo-941864.jpeg?cs=srgb&dl=pexels-chanwalrus-941864.jpg&fm=jpg",
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

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
                    'https://www.liquor.com/thmb/sUKZSwJj7slc5l-LDyK8eajT0LY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/very-sexy-martini-720x720-primary-b1212ebf73f54f898a56f7f0b60c0a34.jpg',
                    height: 300,
                    width: 275,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        'Martini',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Recette avec alcool ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
