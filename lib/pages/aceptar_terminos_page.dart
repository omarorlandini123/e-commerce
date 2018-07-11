import 'package:flutter/material.dart';
import 'package:ecommerce/diseno/ChoiceCard.dart';
import 'package:ecommerce/pages/login_page.dart';

class AceptarTerminosPage extends StatefulWidget {
  static String tag = 'aceptar-terminos-page';
  @override
  _AceptarTerminosPageState createState() => _AceptarTerminosPageState();
}

class _AceptarTerminosPageState extends State<AceptarTerminosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aceptar Términos y Condiciones'),
        actions: <Widget>[
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.tag);
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Row(
                
                 verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Haz click en '),
              Icon(Icons.check, size: 10.0, color: Colors.black),
              Text(' para aceptar '),
              Text('Los términos y condiciones'),
              Text(' de '),
              Text('Servicios y políticas de privacidad'),
              Text(' de Freeler Manager'),
            ],
          ))),
    );
  }
}
