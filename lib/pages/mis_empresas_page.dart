import 'package:flutter/material.dart';
import 'package:ecommerce/pages/pedidos_page.dart';
import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/entidades/Empresa.dart';
import 'package:ecommerce/pages/ingreso_producto_page.dart';
import 'package:ecommerce/pages/productos_page.dart';
import 'package:ecommerce/entidades/TipoDocumento.dart';
import 'package:ecommerce/entidades/TipoEmpresa.dart';
import 'package:ecommerce/pages/items_page.dart';

class MisEmpresasPage extends StatefulWidget {
  static String tag = 'mis-empresas-page';
  @override
  _MisEmpresasPageState createState() => _MisEmpresasPageState();
}

const String _kAsset0 = 'assets/imgs/hamburguesa.jpg';

class _MisEmpresasPageState extends State<MisEmpresasPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  bool mostrarBoton = true;
  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<OpcionMenu> lstMenu;
  List<Empresa> empresas;

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
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.of(context).pushNamed(IngresoProductoPage.tag);
          });
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
    empresas= new List<Empresa>(); 
    for(int y=0;y<50;y++){
      empresas.add(new Empresa("Empresa "+y.toString(), 
      "Detalles empresa "+y.toString(), "DOC"+y.toString(),TipoEmpresa.EMPRESA_PERSONAL));
    }

    lstMenu = new List<OpcionMenu>();

    lstMenu.add(OpcionMenu(Icon(Icons.storage), 'Productos', () {
      Navigator.of(context).popAndPushNamed(ProductosPage.tag);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.receipt), 'Pedidos', () {
      Navigator.of(context).popAndPushNamed(PedidosPage.tag);
    }));

    lstMenu.add(OpcionMenu(Icon(Icons.receipt), 'Mis Empresas', () {
      Navigator.of(context);
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
    _searchOn = false;
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

  bool _searchOn = false;
  AppBar getAppBar() {
    if (_searchOn) {
      return new AppBar(
          title: TextField(
        onChanged: (texto) {},
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Buscar',
            suffixIcon: Icon(Icons.search)),
      ));
    } else {
      return new AppBar(
        title: Text('Mis Empresas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _searchOn = true;
              });
            },
          )
        ],
      );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
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
      body: Container(
        child: ListView(children: 
        empresas.map((Empresa emp){
          return new ListTile(
              leading: const Icon(Icons.business),
              title: Text(emp.nombre),
              //subtitle: const Text(''),
              enabled: true,
              onLongPress: () {},
              onTap: () {

              });
        }).toList()),
        
      ),
      floatingActionButton: getFloatButton(),
    );
  }
}

