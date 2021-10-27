import 'package:flashpark_client/components/rounded_button.dart';
import 'package:flashpark_client/reservas/components/background.dart';
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
            Container(
              height: size.height*0.25,
              width: double.infinity,
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.01),
                  Text("Cedritos", style: TextStyle(fontSize: 18.0),),
                  SizedBox(height: size.height * 0.01),
                  Text("Carrera 7 # 140-15", style: TextStyle(fontSize: 18.0),),
                  SizedBox(height: size.height * 0.01),
                  Text("20 cupos", style: TextStyle(fontSize: 18.0),),
                  SizedBox(height: size.height * 0.01),
                  RoundedButton(
                    text: "Gestionar",
                    press: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MapScreen();
                          },
                        ),
                      );*/
                    },
                  ),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }


}
