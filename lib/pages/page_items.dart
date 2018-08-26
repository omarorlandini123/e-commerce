import 'dart:async';

import 'package:flutter/material.dart';

import 'package:Freeler/widgets/page_items_BotonAgregarDefault.dart';
import 'package:Freeler/widgets/page_items_PreviewCard.dart';

import 'package:Freeler/entidades/ItemAlmacen.dart';
import 'package:Freeler/entidades/Producto.dart';
import 'package:Freeler/entidades/Fotopreview.dart';

import 'package:Freeler/pages/page_items_detalle.dart';
import 'package:Freeler/pages/page_detalle_producto.dart';

class ItemsPage extends StatefulWidget {
  static String tag = "items-page";
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> implements PreviewCardListener {
  List<ItemAlmacen> items;
  List<ItemAlmacen> itemsSelected;
  bool isSelecting;

  @override
  void initState() {
    super.initState();
    isSelecting = false;
    items = new List<ItemAlmacen>();
    itemsSelected = new List<ItemAlmacen>();
    items.add(new ItemAlmacen("Laptop", "Laptop color negro HP", 1.0));
    items.add(new ItemAlmacen("Televisor LG 1", "Televisor LG32\'\' ", 1.0));
    items.add(new ItemAlmacen("Televisor LG 2", "Televisor LG32\'\' ", 1.0));
    items.add(new ItemAlmacen("Televisor LG 3", "Televisor LG32\'\' ", 1.0));
    items.add(new ItemAlmacen("Televisor LG 4", "Televisor LG32\'\' ", 1.0));
    items.add(new ItemAlmacen("Televisor LG 5", "Televisor LG32\'\' ", 1.0));
  }

  @override
  void onLongTab(ItemAlmacen item) {
    setState(() {
      isSelecting = true;
      if (!itemsSelected.contains(item)) {
        itemsSelected.add(item);
      }
    });
  }

  @override
  void ontTab(ItemAlmacen item) {
    if (isSelecting) {
      if (itemsSelected.contains(item)) {
        itemsSelected.remove(item);
      } else {
        itemsSelected.add(item);
      }
      if (itemsSelected.length == 0) {
        isSelecting = false;
      }
      setState(() {});
    } else {
      _abrirDetalleItem(item);
    }
  }

  Future<Null> _abrirDetalleItem([ItemAlmacen item]) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemsDetallePage(item)),
    );
  }

  PreviewCard convertirItemAlmacenACard(ItemAlmacen item) {
    return new PreviewCard(item, itemsSelected.contains(item), this);
  }

  List<PreviewCard> miniaturas() {
    return items.map(convertirItemAlmacenACard).toList();
  }

  Future<Null> _convertirAComboMensaje() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Ofrecer este Combo'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("Debes seleccionar varios items para crear un combo"),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Null> _convertirACombo() async {
    Producto prod = new Producto("", "", 0.0, true);  
    FotoPreview foto = new FotoPreview(0, 'nombre', 'jpeg', new AssetImage("assets/imgs/pollito.jpeg"));
    prod.imagenPreview= null;
    prod.items = itemsSelected;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetalleProductoPage(prod)),
    );
  }

  Widget getAppBar() {
    if (!isSelecting) {
      return new AppBar(
        title: new Text("Mi Almacen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          // FlatButton(
          //   child: Text(
          //     "Combo",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   onPressed: () {
          //     isSelecting = true;
          //     _convertirAComboMensaje();
          //     setState(() {});
          //   },
          // )
        ],
      );
    }
    return new AppBar(
      title: new Text(
        itemsSelected.length.toString() +
            (itemsSelected.length == 1 ? 'item' : ' items'),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          isSelecting = false;
          itemsSelected = new List<ItemAlmacen>();
          setState(() {});
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Ofrecer",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            _convertirACombo();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView.count(
                // Create a grid with 2 columns in portrait mode, or 3 columns in
                // landscape mode.
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                // Generate 100 Widgets that display their index in the List
                children: miniaturas(),
              ));
        },
      ),
      floatingActionButton: new BotonAgregarDefault(() {
        _abrirDetalleItem();
      }),
    );
  }
}
