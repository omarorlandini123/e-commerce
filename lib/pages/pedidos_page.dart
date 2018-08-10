import 'package:flutter/material.dart';
import 'package:ecommerce/pages/productos_page.dart';
import 'package:ecommerce/pages/mis_empresas_page.dart';
import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/pages/items_page.dart';

const String _kAsset0 = 'assets/imgs/hamburguesa.jpg';

class PedidosPage extends StatefulWidget {
  static String tag = 'pedidos-page';
  @override
  _PedidosPageState createState() => _PedidosPageState();
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Enviado', icon: Icons.directions_car),
  const Choice(title: 'Pagado', icon: Icons.monetization_on),
  const Choice(title: 'Eliminar', icon: Icons.delete)
];

class _PedidosPageState extends State<PedidosPage>
    with TickerProviderStateMixin {
  ListTabProductos lista;
  TabController _tabController;
  bool mostrarBoton = true;
  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  List<OpcionMenu> lstMenu;

  List<Widget> tarjetasLista(String image, String nombre, String costo) {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      lista.add(tarjeta(image, nombre, costo));
    }
    return lista;
  }

  List<Widget> tarjetasTerceros(String image, String nombre, String costo) {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      lista.add(tarjetaTercero(image, nombre, costo));
    }
    return lista;
  }

  FloatingActionButton getFloatButton() {
    if (mostrarBoton)
      return FloatingActionButton(
          elevation: 4.0,
          child: new Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {});
    else
      return null;
  }

  Card tarjeta(String image, String nombre, String costo) {
    return new Card(
      elevation: 3.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: new AssetImage(image),
            ),
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
                          nombre,
                          style: TextStyle(fontSize: 16.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                            child: Text(
                          costo,
                          style: TextStyle(fontSize: 16.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  child: Icon(
                                Icons.directions_car,
                                color: Colors.blueAccent,
                                size: 20.0,
                              )),
                              Material(
                                  child: Icon(
                                Icons.monetization_on,
                                color: Colors.greenAccent,
                                size: 20.0,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 15.0),
                        child: Column(
                          children: <Widget>[
                            PopupMenuButton<Choice>(
                              onSelected: _select,
                              itemBuilder: (BuildContext context) {
                                return choices.map((Choice choice) {
                                  return PopupMenuItem<Choice>(
                                      value: choice,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(choice.icon), 
                                          Text(choice.title),
                                        ],
                                      ));
                                }).toList();
                              },
                            ),
                          ],
                        ))
                  ],
                )),
          )
        ],
      ),
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
    );
  }

  Card tarjetaTercero(String image, String nombre, String costo) {
    return new Card(
      elevation: 3.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: new AssetImage(image),
            ),
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
                          nombre,
                          style: TextStyle(fontSize: 16.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                            child: Text(
                          costo,
                          style: TextStyle(fontSize: 16.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  child: Icon(
                                Icons.directions_car,
                                color: Colors.blueAccent,
                                size: 20.0,
                              )),
                              Material(
                                  child: Icon(
                                Icons.monetization_on,
                                color: Colors.greenAccent,
                                size: 20.0,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )),
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
      Navigator.of(context).popAndPushNamed(ProductosPage.tag);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.receipt), 'Pedidos', () {
      Navigator.of(context);
    }));
    
    lstMenu.add(OpcionMenu(Icon(Icons.receipt), 'Mis Empresas', () {
      Navigator.of(context).popAndPushNamed(MisEmpresasPage.tag);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.receipt), 'Mi Almacen', () {
      Navigator.of(context).popAndPushNamed(ItemsPage.tag);
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
          children: tarjetasLista(
              'assets/imgs/hamburguesa.jpg', "Hamburguesa", "Costo: S/10.00"),
        ),
      ),
    );
    lista.addProducto(
        new Tab(text: 'Terceros'),
        new Container(
          child: ListView(
            children: tarjetasTerceros('assets/imgs/pollito.jpeg',
                "Pollito a la Brasa", "Costo: S/24.00"),
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

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: const Text("The drawer's items don't do anything")));
  }

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: lista.getTabs()),
        title: Text('Pedidos'),
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
                                leading: new CircleAvatar(child: opcion.icono),
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
                                  title: const Text('Add account'),
                                  onTap: _showNotImplementedMessage,
                                ),
                                new ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: const Text('Manage accounts'),
                                  onTap: _showNotImplementedMessage,
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
    );
  }
}
