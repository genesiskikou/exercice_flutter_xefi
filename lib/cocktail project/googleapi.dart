import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Place {
  final String name;
  final String address;
  final String photoUrl;
  final double rating;
  final double distance; // We'll calculate this separately

  Place({
    required this.name,
    required this.address,
    required this.photoUrl,
    required this.rating,
    required this.distance,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final photoReference = json['photos'] != null && json['photos'].isNotEmpty
        ? json['photos'][0]['photo_reference']
        : null;
    final photoUrl = photoReference != null
        ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyD4DYtLm4Wc_i3SQe27agExcv8__pGnLXA'
        : 'https://via.placeholder.com/400';

    return Place(
      name: json['name'],
      address: json['vicinity'],
      photoUrl: photoUrl,
      rating: json['rating']?.toDouble() ?? 0.0,
      distance: 0.0, 
    );
  }
}

class GooglePlacesApi {
  static const String apiKey = 'AIzaSyD4DYtLm4Wc_i3SQe27agExcv8__pGnLXA'; 
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

  Future<List<Place>> getNearbyBars(double lat, double lng) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?location=$lat,$lng&radius=1500&type=bar&key=$apiKey'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> results = json['results'];
      return results.map((place) {
        final placeObj = Place.fromJson(place);
        final distance = Geolocator.distanceBetween(
            lat, lng, place['geometry']['location']['lat'], place['geometry']['location']['lng']);
        return Place(
          name: placeObj.name,
          address: placeObj.address,
          photoUrl: placeObj.photoUrl,
          rating: placeObj.rating,
          distance: distance,
        );
      }).toList();
    } else {
      throw Exception('Failed to load nearby bars');
    }
  }
}
