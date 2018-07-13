import 'package:flutter/material.dart';
import 'package:ecommerce/pages/login_page.dart';

class AceptarTerminosPage extends StatefulWidget {
  static String tag = 'aceptar-terminos-page';

  @override
  _AceptarTerminosPageState createState() => _AceptarTerminosPageState();
}

class _AceptarTerminosPageState extends State<AceptarTerminosPage> {
  TextStyle estilo(double tamano, Color color) {
    return new TextStyle(
      color: color,
      fontSize: tamano,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aceptar Términos y Condiciones'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
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
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Text('Haz click en ',
                        textAlign: TextAlign.center,
                        style: estilo(24.0, Colors.black)),
                    Icon(Icons.check, size: 20.0, color: Colors.black),
                    new RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        style: estilo(20.0, Colors.black),
                        text: 'para aceptar',
                        children: <TextSpan>[
                          new TextSpan(
                              text: ' Los términos y condiciones',
                              style: new TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                          new TextSpan(text: ' de '),
                          new TextSpan(
                              text: 'Servicios y políticas de privacidad',
                              style: new TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                          new TextSpan(text: ' de Freeler Manager'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ))),
    );
  }
}
