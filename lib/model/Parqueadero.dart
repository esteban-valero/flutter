import 'package:flutter/material.dart';

class Parqueadero{
  String nombre;
  String direccion;
  String capacidad;
  String imagen;

  Parqueadero(this.nombre, this.direccion, this.capacidad, this.imagen);

  static List<Parqueadero> parqueaderos(){
    return [
      Parqueadero("cedritos", "Carrera 10 # 137-10", "20", "assets/images/parking.jpg"),
      Parqueadero("usaquen", "Carrera 5 # 120-9", "15", "assets/images/parking.jpg"),
      Parqueadero("engativa", "Carrera 50 # 75-13", "10", "assets/images/parking.jpg"),
      Parqueadero("chapinero", "Carrera 7 # 44-10", "25", "assets/images/parking.jpg"),
    ];
  }
}