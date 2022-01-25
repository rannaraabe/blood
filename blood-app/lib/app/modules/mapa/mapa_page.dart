import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoder2/geocoder2.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';

import '../../theme/app_theme.dart';

class donationCenter {
  donationCenter(
      {Key? key,
      required this.name,
      required this.adress,
      required this.phone,
      required this.marker})
      : super();
  final String name;
  final String phone;
  final String adress;
  final Marker marker;
}

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
  bool renderModal = false;
  int closerDonationUnitIndex = 0;
  double distanceToCLoserUnit = 0;
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

  List<donationCenter> donationUnits = [
    donationCenter(
        name: "Hemonorte Dalton Cunha",
        phone: "(84) 3232-6701",
        adress: "Avenida Almirante Alexandrino de Alencar",
        marker: Marker(
          width: 100,
          height: 100,
          point: LatLng(-5.8104912, -35.1965767),
          builder: (ctx) => Container(
            child: Icon(
              Icons.volunteer_activism,
              color: Colors.red,
            ),
          ),
        )),
    donationCenter(
        name: "Associação dos deficientes físicos do RN",
        phone: "(84) 3614-2060",
        adress: "Rua Cariacica",
        marker: Marker(
          width: 100,
          height: 100,
          point: LatLng(-5.749271, -35.246263),
          builder: (ctx) => Container(
            child: Icon(
              Icons.volunteer_activism,
              color: Colors.red,
            ),
          ),
        )),
    donationCenter(
        name: "Hemovida",
        phone: "(84) 3202-4289",
        adress: "Avenida Nilo Peçanha",
        marker: Marker(
          width: 100,
          height: 100,
          point: LatLng(-5.781274, -35.196829),
          builder: (ctx) => Container(
            child: Icon(
              Icons.volunteer_activism,
              color: Colors.red,
            ),
          ),
        )),
  ];

  void swithModalStatus(int index, double distance) {
    setState(() {
      renderModal = !renderModal;
      closerDonationUnitIndex = index;
      distanceToCLoserUnit = distance;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //currentLocation = _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MapController _mapController = MapController();

    return Stack(
      children: [
        FutureBuilder<Position>(
            future: currentLocation = _determinePosition(),
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
                    mapController: _mapController,
                    options: MapOptions(
                      center: LatLng(latitude, longitude),
                      zoom: 18.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [
                          currentDonationCenter,
                          donationUnits[0].marker,
                          donationUnits[1].marker,
                          donationUnits[2].marker
                        ],
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
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          calculateCloserUnit().then((tuple) {
                            _mapController.move(
                                donationUnits[tuple.item1].marker.point, 18.0);
                            swithModalStatus(tuple.item1, tuple.item2);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: renderModal ? null : height * 0.05,
                          width: renderModal ? null : width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: renderModal
                                ? BorderRadius.circular(11.5)
                                : BorderRadius.circular(23.0),
                            color: renderModal ? Colors.white : AppTheme.black,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: renderModal
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              donationUnits[
                                                      closerDonationUnitIndex]
                                                  .name,
                                              style: AppTheme.redTitle,
                                              textAlign: TextAlign.center,
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Endereço: " +
                                                  donationUnits[
                                                          closerDonationUnitIndex]
                                                      .adress +
                                                  "\n" +
                                                  "Telefone: " +
                                                  donationUnits[
                                                          closerDonationUnitIndex]
                                                      .phone +
                                                  "\n" +
                                                  "Distancia: " +
                                                  distanceToCLoserUnit
                                                      .toStringAsFixed(2) +
                                                  "km",
                                              style: AppTheme.style_black,
                                              textAlign: TextAlign.start,
                                            )
                                          ],
                                        )
                                      : Text(
                                          "Encontre a unidade mais próxima",
                                          style: AppTheme.style_black,
                                          textAlign: TextAlign.center,
                                        ))
                            ],
                          ),
                        ),
                      ),
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

  Future<Tuple2<int, double>> calculateCloserUnit() async {
    Position actual = await currentLocation;
    int unitIndex = 0;
    int indexToReturn = -1;
    double bestDistance = double.maxFinite;
    double actualDistance = double.maxFinite;
    for (donationCenter unit in donationUnits) {
      actualDistance = Geolocator.distanceBetween(
          actual.latitude,
          actual.longitude,
          unit.marker.point.latitude,
          unit.marker.point.longitude);
      if (actualDistance < bestDistance) {
        indexToReturn = unitIndex;
        bestDistance = actualDistance;
      }
      print("acutal: " +
          actualDistance.toStringAsFixed(2) +
          " - bestDistance: " +
          bestDistance.toStringAsFixed(2));
      unitIndex++;
    }
    //print(bestDistance.toStringAsPrecision(2));
    return Tuple2(indexToReturn, bestDistance);
  }
}
