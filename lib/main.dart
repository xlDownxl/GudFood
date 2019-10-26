import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'models/location.dart';
import 'models/restaurant.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Restaurant> restaurants;

  Set<Marker> convertToMarkers() {
    return  restaurants.map((restaurant) {
      return Marker(
        markerId: MarkerId(restaurant.id),
        position: LatLng(restaurant.location.latitude, restaurant.location.longitude),
        infoWindow: InfoWindow(
          title: restaurant.name,
          snippet: restaurant.description,
        ),
      );
    }).toSet();
  }



  @override
  void initState() {
    restaurants= [
      Restaurant("id1","chinesische restaurant",Location(35.511491, 139.625461),"Chinesisches Restaurant am fluss"),
      Restaurant("id2","mongolsisch restaurant",Location(35.513491, 139.625461),"Mongolisch Restaurant am berg"),
      Restaurant("id3","mexikanisch restaurant",Location(35.512491, 139.625461),"Mexikanisches Restaurant am ende"),
    ];

    // TODO: implement initState
    super.initState();
  }

  void _onMapCreatedNew(GoogleMapController controller) {}

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Restaurant Locations'),
            backgroundColor: Colors.green[700],
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreatedNew,
            initialCameraPosition: CameraPosition(
              target: const LatLng(0, 0),
              zoom: 2,
            ),
            markers: convertToMarkers(),
          ),
        ),
      );
}
