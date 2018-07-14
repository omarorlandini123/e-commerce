import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    lista = new ListTabProductos();
    lista.addProducto(
      new Tab(text: 'Propios'),
      new Container(
        margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
        child: new ListView(
          children: <Widget>[
            new Card(
              child: Text(
                'Producto 1',
                style: TextStyle(height: 5.0),
              ),
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            new Card(
              child: Text(
                'Producto 3',
                style: TextStyle(height: 5.0),
              ),
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            new Card(
              child: Text(
                'Producto 2',
                style: TextStyle(height: 5.0),
              ),
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
            )
          ],
        ),
      ),
    );
    lista.addProducto(new Tab(text: 'Terceros'), new Container());

    _tabController =
        new TabController(vsync: this, length: lista.getTabs().length);
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
        body: new TabBarView(
            controller: _tabController, children: lista.getElementos()),
        floatingActionButton: FloatingActionButton(
            elevation: 4.0,
            child: new Icon(Icons.add),
            backgroundColor: Colors.purple[700],
            onPressed: () {}),
        bottomNavigationBar: new Material(
          color: Colors.purple[900],
          child: new Container(
              height: 60.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    textColor: Colors.white,
                    icon: Icon(Icons.storage),
                    label: Text('Productos'),
                    onPressed: () {},
                  ),
                  FlatButton.icon(
                    textColor: Colors.white,
                    icon: Icon(Icons.receipt),
                    label: Text('Pedidos'),
                    onPressed: () {},
                  )
                ],
              )),
        ));
  }
}
