class User {
  String phone;
  String apellido;
  String name;
  String pasword;

  String email;
  String vehiculo;
  String placa;

  User(this.phone);

  Map<String, dynamic> toJson() => {
        'celular': phone,
        'email': email,
        'name': name,
        'apellido': apellido,
        'placa': placa,
        'vehiculo': vehiculo
        //'Pasword': pasword,
      };
}
