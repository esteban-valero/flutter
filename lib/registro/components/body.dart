import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashpark_client/Services/Provider_Widget.dart';
import 'package:flashpark_client/components/text_field_container.dart';
import 'package:flashpark_client/registro/components/background.dart';
import 'package:flashpark_client/components/rounded_button.dart';
import 'package:flashpark_client/components/rounded_input_field_general.dart';
import 'package:flashpark_client/mapScreen/map.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email, password, nombre, apellido, celular, vehiculo, placa;

  final auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            CircleAvatar(
              child: Image.asset(
                "assets/images/avatar.png",
                //width: size.width*0.8,
              ),
              minRadius: 50,
              maxRadius: 75,
            ),
            RoundedInputFieldGeneral(
              hintText: "Correo",
              onChanged: (value) {
                email = value.trim();
              },
            ),
            TextFieldContainer(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Contraseña",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    )),
                onChanged: (value) {
                  setState(() {
                    password = value.trim();
                  });
                },
              ),
            ),
            RoundedInputFieldGeneral(
              hintText: "Nombre",
              onChanged: (value) {
                setState(() {
                  nombre = value.trim();
                });
              },
            ),
            RoundedInputFieldGeneral(
              hintText: "Apellido",
              onChanged: (value) {
                setState(() {
                  apellido = value.trim();
                });
              },
            ),
            RoundedInputFieldGeneral(
              hintText: "Celular",
              onChanged: (value) {
                setState(() {
                  celular = value.trim();
                });
              },
            ),
            RoundedInputFieldGeneral(
              hintText: "Tipo de Vehiculo",
              onChanged: (value) {
                setState(() {
                  vehiculo = value.trim();
                });
              },
            ),
            RoundedInputFieldGeneral(
              hintText: "Placa",
              onChanged: (value) {
                setState(() {
                  placa = value.trim();
                });
              },
            ),
            RoundedButton(
              text: "Registrarse",
              press: () async {
                final auth = Provider.of(context).auth;
                if (await auth.signUp(email, password, placa, nombre, apellido,
                        vehiculo, celular) ==
                    "Signed UP") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MapScreen();
                      },
                    ),
                  );
                } else
                  CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
