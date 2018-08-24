import 'package:flutter/material.dart';

import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/pages/pedidos_page.dart';
import 'package:ecommerce/pages/mis_empresas_page.dart';
import 'package:ecommerce/pages/items_page.dart';
import 'package:ecommerce/pages/mis_contactos_page.dart';
class DrawerPage extends StatefulWidget {


  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;
  List<OpcionMenu> lstMenu;

  @override
  initState(){
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
  }


  Widget getHeader() {
    return new UserAccountsDrawerHeader(
      accountName: const Text('Juan Perez'),
      accountEmail: const Text('juan.perez@example.com'),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: AssetImage(""),
      ),
      margin: EdgeInsets.zero,
      onDetailsPressed: () {
        _showDrawerContents = !_showDrawerContents;
        if (_showDrawerContents)
          _controller.reverse();
        else
          _controller.forward();
      },
    );
  }

  Widget getOpcionesGenerales() {
    return new FadeTransition(
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
    );
  }

  Widget getOpcionesUsuario() {
    return new SlideTransition(
      position: _drawerDetailsPosition,
      child: new FadeTransition(
        opacity: new ReverseAnimation(_drawerContentsOpacity),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Agregar Cuenta'),
              onTap: () {
                print("Agregar Cuenta clicked");
              },
            ),
            new ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Administrar cuentas'),
              onTap: () {
                print("Administrar Cuenta clicked");
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          getHeader(),
          new MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: new Expanded(
              child: new ListView(
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      getOpcionesGenerales(),
                      getOpcionesUsuario(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
