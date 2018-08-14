import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/validar_numero_page.dart';
import 'package:ecommerce/pages/registro_page.dart';
import 'package:ecommerce/pages/productos_page.dart';
import 'package:ecommerce/pages/pedidos_page.dart';
import 'package:ecommerce/pages/ingreso_producto_page.dart';
import 'package:ecommerce/pages/mis_empresas_page.dart';
import 'package:ecommerce/pages/detalle_producto_page.dart';
import 'package:ecommerce/pages/items_page.dart';
import 'package:ecommerce/pages/items_detalle_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final routes= <String, WidgetBuilder>{
    LoginPage.tag : (context)=>LoginPage(),
    ValidarNumeroPage.tag : (context)=>ValidarNumeroPage(),
    RegistroPage.tag: (context)=>RegistroPage(),
    ProductosPage.tag : (context)=>ProductosPage(),
    PedidosPage.tag: (context)=>PedidosPage(),
    IngresoProductoPage.tag : (context)=>IngresoProductoPage(),
    MisEmpresasPage.tag : (context)=>MisEmpresasPage(),
    DetalleProductoPage.tag : (context)=>DetalleProductoPage(""),
    ItemsPage.tag : (context)=>ItemsPage(),
    ItemsDetallePage.tag: (context)=>ItemsDetallePage(),
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
        primaryColor:  Colors.indigo,//const Color.fromARGB(0x00, 0x70, 0xC0, 0x01),
        buttonColor: Colors.orange,
        accentColor: Colors.indigoAccent,
      ),
      title: 'E-commerce',
      home: LoginPage(),
      routes: routes,
    );
  }
}