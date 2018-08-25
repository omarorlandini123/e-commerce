import 'package:flutter/material.dart';

import 'package:ecommerce/widgets/page_general_drawer.dart';
import 'package:ecommerce/widgets/page_productos_ProductoCard.dart';

import 'package:ecommerce/pages/page_items.dart';

import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/entidades/Producto.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';
import 'package:ecommerce/entidades/FotoPreview.dart';


class ProductosPage extends StatefulWidget {
  static String tag = 'productos-page';
  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class TabProductos {
  Tab tab;
  Widget elemento;
  TabProductos(this.tab, this.elemento);
}

class ListTabProductos {
  List<TabProductos> productos;
  List<Tab> tabs;
  List<Widget> elementos;

  ListTabProductos() {
    productos = new List<TabProductos>();
    tabs = new List<Tab>();
    elementos = new List<Widget>();
  }

  void addProducto(Tab tab, Widget elemento) {
    productos.add(new TabProductos(tab, elemento));
    tabs.add(tab);
    elementos.add(elemento);
  }

  List<Tab> getTabs() {
    return tabs;
  }

  List<Widget> getElementos() {
    return elementos;
  }
}

class _ProductosPageState extends State<ProductosPage>
    with TickerProviderStateMixin {
      
  ListTabProductos lista;
  TabController _tabController;
  bool mostrarBoton = true; 
  

  List<OpcionMenu> lstMenu;

  List<Widget> tarjetasListaTerceros() {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      Producto prod = new Producto("Producto Terceros "+(i+1).toString(),"Detalles "+(i+1).toString(), 12.0,  true);
      FotoPreview foto= new FotoPreview(0, 'nombre', 'jpeg', new AssetImage("assets/imgs/pollito.jpeg"));
      prod.imagenPreview= foto ;
      lista.add(new ProductoCard(prod));
    }
    return lista;
  }

  List<Widget> tarjetasLista() {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      Producto prod = new Producto("Producto "+(i+1).toString(),"Detalles "+(i+1).toString(), 16.0, false, new DateTime.now());
      FotoPreview foto= new FotoPreview(0, 'nombre', 'jpeg', new AssetImage("assets/imgs/pollito.jpeg"));
      prod.imagenPreview= foto ;
      ItemAlmacen item = new ItemAlmacen("Item 1","detalle 1", 2.0);
      ItemAlmacen item2 = new ItemAlmacen("Item 2","detalle 2", 33.0);
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
    
    lista = new ListTabProductos();
    lista.addProducto(
      new Tab(
        text: 'Propios',
      ),
      new Container(
        child: ListView(
          children: tarjetasLista(),
        ),
      ),
    );
    lista.addProducto(
        new Tab(text: 'Terceros'),
        new Container(
          child: ListView(
            children: tarjetasListaTerceros(),
          ),
        ));

    _tabController =
        new TabController(vsync: this, length: lista.getTabs().length);
    _tabController.addListener(() {
      this.setState(() {
        if (_tabController.index == 1) {
          mostrarBoton = false;
        } else {
          mostrarBoton = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    tabController.dispose();
  }

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: lista.getTabs()),
        title: Text('Productos'),
      ),
      drawer: new DrawerPage(),
      body: new TabBarView(
          controller: _tabController, children: lista.getElementos()),
      floatingActionButton: getFloatButton(),
    );
  }
}
