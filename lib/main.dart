import 'package:flutter/material.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/validar_numero_page.dart';
import 'package:ecommerce/pages/registro_page.dart';
import 'package:ecommerce/pages/productos_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final routes= <String, WidgetBuilder>{
    LoginPage.tag : (context)=>LoginPage(),
    ValidarNumeroPage.tag : (context)=>ValidarNumeroPage(),
    RegistroPage.tag: (context)=>RegistroPage(),
    ProductosPage.tag : (context)=>ProductosPage()
  };

  MyApp();

  factory MyApp.forDesignTime() {    
    return new MyApp();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple[800],
        accentColor: Colors.purpleAccent[600],
      ),
      title: 'E-commerce',
      home: LoginPage(),
      routes: routes,
    );
  }
}