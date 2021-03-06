import 'package:flashpark_client/Services/Provider_Widget.dart';
import 'package:flashpark_client/components/rounded_button.dart';
import 'package:flashpark_client/editarPerfil/editar.dart';
import 'package:flashpark_client/model/User.dart';
import 'package:flashpark_client/verPerfil/components/background.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<Body> {
  User user = User("");
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  String nameController = '';
  final TextEditingController namController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            CircleAvatar(
              child: Image.asset(
                "assets/images/avatar.png",
                //width: size.width*0.8,
              ),
              minRadius: 50,
              maxRadius: 75,
            ),
            SizedBox(height: size.height * 0.08),
            Column(
              children: [
                FutureBuilder(
                  future: Provider.of(context).auth.getCurrentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return displayUserInformation(context, snapshot);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
            RoundedButton(
              text: "Editar",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditarPerfil();
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

  Widget displayUserInformation(context, snapshot) {
    //return Text("data");
    final authData = snapshot.data;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Created: ${DateFormat('MM/dd/yyyy').format(authData.metadata.creationTime)}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        FutureBuilder(
            future: _getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Table(
                          // textDirection: TextDirection.rtl,
                          //defaultVerticalAlignment: TableCellVerticalAlignment.top,
                          defaultColumnWidth: IntrinsicColumnWidth(),
                          children: [
                            TableRow(children: [
                              Text(
                                "Nombre:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.name,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(height: 15), //SizeBox Widget
                              SizedBox(height: 15), //SizeBox Widget
                            ]),
                            TableRow(children: [
                              Text(
                                "Email:",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.email,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(height: 15), //SizeBox Widget
                              SizedBox(height: 15), //SizeBox Widget
                            ]),
                            TableRow(children: [
                              Text(
                                "Telefono:",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.phone,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(height: 15), //SizeBox Widget
                              SizedBox(height: 15), //SizeBox Widget
                            ]),
                            TableRow(children: [
                              Text(
                                "Vehiculo:",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.vehiculo,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(height: 15), //SizeBox Widget
                              SizedBox(height: 15), //SizeBox Widget
                            ]),
                            TableRow(children: [
                              Text(
                                "Placa:",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.placa,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _getProfileData() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    print("User ID $uid");
    await Provider.of(context)
        .db
        .collection("users")
        .doc(uid)
        .get()
        .then((result) {
      user.phone = result.data()['celular'];
      user.apellido = result.data()['apellido'];
      user.name = result.data()['name'];
      user.email = result.data()['email'];
      user.placa = result.data()['placa'];
      user.vehiculo = result.data()['vehiculo'];
    });
  }
}
