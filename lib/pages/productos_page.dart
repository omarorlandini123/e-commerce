import 'package:flutter/material.dart';
import 'package:ecommerce/pages/pedidos_page.dart';
import 'package:ecommerce/widgets/general_page_drawer.dart';
import 'mis_contactos_page.dart';
import 'package:ecommerce/pages/mis_empresas_page.dart';
import 'package:ecommerce/pages/detalle_producto_page.dart';
import 'package:ecommerce/pages/items_page.dart';

import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/entidades/Producto.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';
import 'package:ecommerce/entidades/FotoPreview.dart';

const String _kAsset0 = 'assets/imgs/hamburguesa.jpg';

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
  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;
  

  List<OpcionMenu> lstMenu;

  List<Widget> tarjetasListaTerceros() {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      Producto prod = new Producto("Producto Terceros "+(i+1).toString(),"Detalles "+(i+1).toString(), 12.0,  true);
      FotoPreview foto= new FotoPreview(0, 'nombre', 'jpeg', new AssetImage("assets/imgs/pollito.jpeg"));
      prod.imagenPreview= foto ;
      lista.add(tarjeta(prod));
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
      lista.add(tarjeta(prod));
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

  Card tarjeta(Producto prod) {
    
    return new Card(
      elevation: 3.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetalleProductoPage(prod)),
              );
            },
            child: Hero(
              tag:'image-hero'+prod.nombre,
              child:Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: CircleAvatar(
                radius: 35.0,
                
                backgroundImage:prod.imagenPreview.imageProvider,
              ),
            ),)
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 10.0, left: 5.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Material(
                            child: Text(
                          prod.nombre,
                          style: TextStyle(fontSize: 16.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                            child: Text(
                          "S/ "+prod.precio.toString(),
                          style: TextStyle(fontSize: 16.0),
                        ))
                      ],
                    )),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 15.0),
                        child: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                          iconSize: 30.0,
                        ))
                  ],
                )),
          )
        ],
      ),
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
    );
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
