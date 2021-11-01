import 'dart:ffi';

import 'package:flashpark_client/components/rounded_button.dart';
import 'package:flashpark_client/constants.dart';
import 'package:flashpark_client/model/Directions_Model.dart';
import 'package:flashpark_client/reservarParqueadero/reservar.dart';
import 'package:flashpark_client/reservas/reservas.dart';
import 'package:flashpark_client/verPerfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _index = 0;

  Location location = new Location();
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  bool _serviceEnabled;
  Directions _info;

  List<Marker> markers = [];

  GoogleMapController _googleMapController;

  //Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void getLocation() async {
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  void addMarkers() {
    Marker firstMarker = Marker(
      markerId: MarkerId('Parqueadero 1'),
      position: LatLng(4.717832, -74.029695),
      infoWindow: InfoWindow(
          title: 'Parqueadero 1',
          snippet: 'Cupos disponibles: 3',
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Carrera 142 # 19 - 45",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Cupos disponibles: 3",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          RoundedButton(
                            text: "Reservar",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ReservarParqueadero();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ));
                });
          }),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker secondMarker = Marker(
      markerId: MarkerId('Parqueadero 2'),
      position: LatLng(4.715223, -74.029963),
      infoWindow: InfoWindow(
          title: 'Parqueadero 2',
          snippet: 'Cupos disponibles: 23',
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04),
                          Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Carrera 138 # 22 - 30",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Cupos disponibles: 23",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              RoundedButton(
                                text: "Reservar",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ReservarParqueadero();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ));
                });
          }),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker thirdMarker = Marker(
      markerId: MarkerId('Parqueadero 3'),
      position: LatLng(4.718784, -74.030671),
      infoWindow: InfoWindow(
          title: 'Parqueadero 3',
          snippet: 'Cupos disponibles: 10',
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04),
                          Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Carrera 139 # 10 - 13",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Cupos disponibles: 10",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              RoundedButton(
                                text: "Reservar",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ReservarParqueadero();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ));
                });
          }),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    markers.add(firstMarker);
    markers.add(secondMarker);
    markers.add(thirdMarker);
  }

  @override
  Widget build(BuildContext context) {
    addMarkers();
    Size size = MediaQuery.of(context).size;
    getLocation();
    var _initialCameraPosition = CameraPosition(
      target: LatLng(4.715881, -74.031389),
      zoom: 18.5,
    );
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: markers.map((e) => e).toSet(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: orangePark,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: orangePark,
            primaryColor: Colors.black,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: orangePark))),
        // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) {
            setState(() {
              this._index = index;
            });
            _navigateToScreens(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              label: "Mapa",
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.car_repair),
              label: "Reservas",
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: "Perfil",
            )
          ],
        ),
      ),
    );
  }

  _navigateToScreens(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MapScreen();
          },
        ),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VerReservas();
          },
        ),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VerPerfil();
          },
        ),
      );
    }
  }
}
