import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoder2/geocoder2.dart';
import 'package:latlong2/latlong.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapApp(),
    );
  }
}

class MapApp extends StatefulWidget {
  @override
  _MapAppState createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  //String _address,_dateTime;
  late Future<Position> currentLocation;
  double long = 49.5;
  double lat = -0.09;
  LatLng point = LatLng(49.5, -0.09);
  Marker currentDonationCenter = Marker(
    width: 80.0,
    height: 80.0,
    point: LatLng(-5.80601000, -35.20650000),
    builder: (ctx) => Container(
      child: Icon(
        Icons.location_on_rounded,
        color: Colors.red,
      ),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLocation = _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<Position>(
            future: _determinePosition(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.red[400]),
                );
              } else if (snapshot.hasData) {
                if (snapshot.hasData) {
                  final latitude = snapshot.data!.latitude;
                  final longitude = snapshot.data!.longitude;

                  return FlutterMap(
                    options: MapOptions(
                      center: LatLng(-5.80601000, -35.20650000),
                      zoom: 18.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [currentDonationCenter],
                      ),
                    ],
                  );
                } else {
                  return Text("Erro ao procurar a ação com esse cógido");
                }
              } else {
                return Text("");
              }
            }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.all(16.0),
                    hintText: "Busque por uma unidade de doação",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Aqui vão algumas infos sobre a unidade"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
