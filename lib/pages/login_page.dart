import 'package:flutter/material.dart';
import 'validar_numero_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'Hero',
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60.0,
            //child: Image.asset('assets/imgs/logo.png')
            )
            );

    final lbltelefono = Text(
      'Número',
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontStyle: FontStyle.normal
      ),
      textAlign: TextAlign.left
    );

    final telefono = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Ingresa tu número de teléfono',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    
    final loginButton = Padding(      
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightGreenAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed(ValidarNumeroPage.tag);
          },
          color: Colors.purple,
          child: Text('Solicitar Registro', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

  

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(
              height: 48.0,
            ),
            lbltelefono,
            telefono, 
            Container(
              margin: EdgeInsets.only(left: 100.0),
              width: 300.0,
              alignment: Alignment.centerRight,
               child: loginButton),
          ],
        ),
      ),
    );
  }
}
