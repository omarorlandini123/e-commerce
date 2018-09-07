import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:Freeler/widgets/page_general_drawer.dart';
import 'package:Freeler/widgets/page_productos_ProductoCard.dart';
import 'package:Freeler/widgets/page_general_TabGeneral.dart';

import 'package:Freeler/pages/page_items.dart';

import 'package:Freeler/entidades/Producto.dart';
import 'package:Freeler/entidades/ItemAlmacen.dart';
import 'package:Freeler/entidades/FotoPreview.dart';

class ProductosPage extends StatefulWidget {
  static String tag = 'productos-page';
  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage>
    with TickerProviderStateMixin {
  TabGeneral lista;
  TabController tabController;
  bool mostrarBoton = true;

  Future<List<Producto>> fetchProductos() async {
    final response = await http.get('http://test.exac-tic.com/Producto');
    return compute(parseProductos, response.body);
  }
  
  List<Producto> parseProductos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Producto>((json) => Producto.fromJson(json)).toList();
  }

  List<Widget> tarjetasListaTerceros() {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      Producto prod = new Producto("Producto Terceros " + (i + 1).toString(),
          "Detalles " + (i + 1).toString(), 12.0, true);
      FotoPreview foto = new FotoPreview(
          0, 'nombre', 'jpeg', new AssetImage("assets/imgs/pollito.jpeg"));
      prod.imagenPreview = foto;
      lista.add(new ProductoCard(prod));
    }
    return lista;
  }

  List<Widget> tarjetasListaParse(List<Producto> productosHttp) {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < productosHttp.length; i++) {     
      lista.add(new ProductoCard(productosHttp[i]));
    }
    return lista;
  }

  List<Widget> tarjetasLista() {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      Producto prod = new Producto("Producto " + (i + 1).toString(),
          "Detalles " + (i + 1).toString(), 16.0, false, new DateTime.now());
      FotoPreview foto = new FotoPreview(
          0, 'nombre', 'jpeg', new AssetImage("assets/imgs/pollito.jpeg"));
      prod.imagenPreview = foto;
      ItemAlmacen item = new ItemAlmacen("Item 1", "detalle 1", 2.0);
      ItemAlmacen item2 = new ItemAlmacen("Item 2", "detalle 2", 33.0);
      prod.addItem(item);
      prod.addItem(item2);
      lista.add(new ProductoCard(prod));
    }
    return lista;
  }

  FloatingActionButton getFloatButton() {
    if (mostrarBoton)
      return FloatingActionButton(
          elevation: 4.0,
          child: new Icon(Icons.add),
          backgroundColor: Theme.of(context).buttonColor,
          onPressed: () {
            Navigator.of(context).pushNamed(ItemsPage.tag);
          });
    else
      return null;
  }

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: 3, vsync: this);

    lista = new TabGeneral();
    lista.addTab(
      new Tab(
        text: 'Propios',
      ),
      new Container(
        child: ListView(
          children: tarjetasLista(),
        ),
      ),
    );
    lista.addTab(
        new Tab(text: 'Terceros'),
        new Container(
          child: ListView(
            children: tarjetasListaTerceros(),
          ),
        ));

    tabController =
        new TabController(vsync: this, length: lista.getTabs().length);
    tabController.addListener(() {
      this.setState(() {
        if (tabController.index == 1) {
          mostrarBoton = false;
        } else {
          mostrarBoton = true;
        }
      });
    });

    fetchProductos().then((val) => setState(() {
          tarjetasListaParse(val);
        }));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: TabBar(controller: tabController, tabs: lista.getTabs()),
        title: Text('Productos'),
      ),
      drawer: new DrawerPage(),
      body: new TabBarView(
          controller: tabController, children: lista.getElementos()),
      floatingActionButton: getFloatButton(),
    );
  }
}
