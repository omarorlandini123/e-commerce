import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ecommerce/pages/page_login.dart';
import 'package:ecommerce/pages/page_validar_numero.dart';
import 'package:ecommerce/pages/page_registro.dart';
import 'package:ecommerce/pages/page_productos.dart';
import 'package:ecommerce/pages/page_pedidos.dart';
import 'package:ecommerce/pages/page_ingreso_producto.dart';
import 'package:ecommerce/pages/page_mis_empresas.dart';
import 'package:ecommerce/pages/page_detalle_producto.dart';
import 'package:ecommerce/pages/page_items.dart';
import 'package:ecommerce/pages/page_items_detalle.dart';
import 'package:ecommerce/pages/page_mis_contactos.dart';

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
    DetalleProductoPage.tag : (context)=>DetalleProductoPage(),
    ItemsPage.tag : (context)=>ItemsPage(),
    ItemsDetallePage.tag: (context)=>ItemsDetallePage(),
    MisContactosPage.tag: (context)=>MisContactosPage(),
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