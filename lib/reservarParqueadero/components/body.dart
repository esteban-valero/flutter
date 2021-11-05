import 'package:flashpark_client/components/rounded_button.dart';
import 'package:flashpark_client/components/rounded_input_field_general.dart';
import 'package:flashpark_client/mapScreen/map.dart';
import 'package:flashpark_client/reservarParqueadero/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            RoundedInputFieldGeneral(
              hintText: "Fecha",
              onChanged: (value){},
            ),
            RoundedInputFieldGeneral(
              hintText: "Hora llegada",
              onChanged: (value){},
            ),
            RoundedInputFieldGeneral(
              hintText: "Hora salida",
              onChanged: (value){},
            ),
            RoundedButton(
              text: "Realizar reserva",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

