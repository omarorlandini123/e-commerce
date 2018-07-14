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
  bool mostrarBoton = true;

  List<Widget> tarjetasLista(String image, String nombre, String costo) {
    List<Widget> lista = new List<Widget>();
    for (var i = 0; i < 15; i++) {
      lista.add(tarjeta(image, nombre, costo));
    }
    return lista;
  }

  FloatingActionButton getFloatButton() {
    if (mostrarBoton)
      return FloatingActionButton(
          elevation: 4.0,
          child: new Icon(Icons.add),
          backgroundColor: Colors.purple[700],
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
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: new AssetImage(image),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 15.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Material(
                            child: Text(
                          nombre,
                          style: TextStyle(fontSize: 18.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                            child: Text(
                          costo,
                          style: TextStyle(fontSize: 18.0),
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
          children: tarjetasLista(
              'assets/imgs/hamburguesa.jpg', "Hamburguesa", "Costo: S/10.00"),
        ),
      ),
    );
    lista.addProducto(
        new Tab(text: 'Terceros'),
        new Container(
          child: ListView(
            children: tarjetasLista('assets/imgs/pollito.jpeg',
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
        floatingActionButton: getFloatButton(),
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
