import 'package:carousel_slider/carousel_slider.dart';
import 'package:exercice_flutter_1/models.dart';
import 'package:exercice_flutter_1/cocktail%20project/cocktailapi.dart'; 
import 'package:exercice_flutter_1/cocktail%20project/googleapi.dart'; 
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomepageCocktail extends StatefulWidget {
  const HomepageCocktail({super.key});

  @override
  _HomepageCocktailState createState() => _HomepageCocktailState();
}

class _HomepageCocktailState extends State<HomepageCocktail> {
  late Future<List<Cocktail>> futureCocktails;
  late Future<List<Place>> futureBars;

  @override
  void initState() {
    super.initState();
    futureCocktails = CocktailApi().fetchMultipleRandomCocktails(5);
    futureBars = _getNearbyBars();
  }

  Future<List<Place>> _getNearbyBars() async {
    Position position = await _determinePosition();
    print('Position: ${position.latitude}, ${position.longitude}'); // Debugging
    return GooglePlacesApi().getNearbyBars(position.latitude, position.longitude);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can continue
    return await Geolocator.getCurrentPosition();
  }

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
            FutureBuilder<List<Cocktail>>(
              future: futureCocktails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final cocktails = snapshot.data!;
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                    ),
                    items: cocktails.map((cocktail) {
                      return Builder(
                        builder: (BuildContext context) {
                          return CardExample(
                            name: cocktail.name,
                            imageUrl: cocktail.imageUrl,
                          );
                        },
                      );
                    }).toList(),
                  );
                } else {
                  return Center(child: Text('No data'));
                }
              },
            ),
            Text(
              "Les bars disponibles",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder<List<Place>>(
              future: futureBars,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final bars = snapshot.data!;
                  return Column(
                    children: bars.map((bar) {
                      return ListAvatarbar(
                        lien: bar.photoUrl,
                        title: bar.name,
                        subtitle: bar.address,
                      );
                    }).toList(),
                  );
                } else {
                  return Center(child: Text('No data'));
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
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
                  bottom: 10,
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

class ListAvatarbar extends StatelessWidget {
  final String lien;
  final String title;
  final String subtitle;

  const ListAvatarbar({
    super.key,
    required this.lien,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: ClipOval(
              child: Image.network(
                lien,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
          ),
          SizedBox(width: 16), // Add some space between the image and the text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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