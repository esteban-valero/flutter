import 'package:flashpark_client/constants.dart';
import 'package:flashpark_client/reservas/reservas.dart';
import 'package:flashpark_client/verPerfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(4.716015776135574, -74.03172166141465),
                  zoom: 16.0,
                ),
                zoomGesturesEnabled: true,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: orangePark,
            primaryColor: Colors.black,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color:
                        orangePark))), // sets the inactive color of the `BottomNavigationBar`
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
