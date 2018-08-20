import 'package:flutter/material.dart';
import 'package:ecommerce/pages/pedidos_page.dart';
import 'package:ecommerce/pages/ingreso_producto_page.dart';
import 'mis_contactos_page.dart';
import 'package:ecommerce/pages/mis_empresas_page.dart';
import 'package:ecommerce/pages/detalle_producto_page.dart';
import 'package:ecommerce/pages/items_page.dart';

import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/entidades/Producto.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';

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
      prod.imagenPreview= new AssetImage("assets/imgs/pollito.jpeg");
      lista.add(tarjeta(prod));
    }
    return lista;
  }

  List<Widget> tarjetasLista() {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      Producto prod = new Producto("Producto "+(i+1).toString(),"Detalles "+(i+1).toString(), 16.0, false, new DateTime.now());
      prod.imagenPreview= new AssetImage("assets/imgs/hamburguesa.jpg");
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
              tag:'image-hero'+prod.nombreProducto,
              child:Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage:prod.imagenPreview,
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
                          prod.nombreProducto,
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

    lstMenu = new List<OpcionMenu>();

    lstMenu.add(OpcionMenu(Icon(Icons.storage), 'Productos', () {
      Navigator.of(context);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.reorder), 'Pedidos', () {
      Navigator.of(context).popAndPushNamed(PedidosPage.tag);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.domain), 'Mis Empresas', () {
      Navigator.of(context).popAndPushNamed(MisEmpresasPage.tag);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.local_convenience_store), 'Mi Almacen', () {
      Navigator.of(context).popAndPushNamed(ItemsPage.tag);
    }));
    lstMenu.add(OpcionMenu(Icon(Icons.contacts), 'Mis Contactos', () {
      Navigator.of(context).popAndPushNamed(MisContactosPage.tag);
    }));

    tabController = new TabController(length: 3, vsync: this);
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _drawerContentsOpacity = new CurvedAnimation(
      parent: new ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = new Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
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
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text('Juan Perez'),
              accountEmail: const Text('juan.perez@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(_kAsset0),
              ),
              margin: EdgeInsets.zero,
              onDetailsPressed: () {
                _showDrawerContents = !_showDrawerContents;
                if (_showDrawerContents)
                  _controller.reverse();
                else
                  _controller.forward();
              },
            ),
            new MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: new Expanded(
                child: new ListView(
                  padding: const EdgeInsets.only(top: 8.0),
                  children: <Widget>[
                    new Stack(
                      children: <Widget>[
                        // The initial contents of the drawer.
                        new FadeTransition(
                          opacity: _drawerContentsOpacity,
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: lstMenu.map((OpcionMenu opcion) {
                              return new ListTile(
                                leading: new CircleAvatar(
                                  backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    child: opcion.icono),
                                title: new Text(opcion.etiqueta),
                                onTap: opcion.onPressed,
                              );
                            }).toList(),
                          ),
                        ),
                        // The drawer's "details" view.
                        new SlideTransition(
                          position: _drawerDetailsPosition,
                          child: new FadeTransition(
                            opacity:
                                new ReverseAnimation(_drawerContentsOpacity),
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                new ListTile(
                                  leading: const Icon(Icons.add),
                                  title: const Text('Agregar Cuenta'),
                                  onTap:(){print("Agregar Cuenta clicked");} ,
                                ),
                                new ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: const Text('Administrar cuentas'),
                                  onTap:(){print("Administrar Cuenta clicked");},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: new TabBarView(
          controller: _tabController, children: lista.getElementos()),
      floatingActionButton: getFloatButton(),
    );
  }
}
