import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ecommerce/pages/page_items_detalle.dart';
import 'package:ecommerce/entidades/Producto.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';

class DetalleProductoPage extends StatefulWidget {
  static String tag = 'detalle-product-page';

  final Producto productoSel;
  DetalleProductoPage([this.productoSel]);

  @override
  _DetalleProductoPageState createState() {
    if (this.productoSel == null) {
      return _DetalleProductoPageState();
    }
    return _DetalleProductoPageState(this.productoSel);
  }
}

final double tamanoTexto = 16.0;
final double espaciado = 8.0;

class _DetalleProductoPageState extends State<DetalleProductoPage>
    with TickerProviderStateMixin {
  Producto productoSel;
  ListTabItemsAlmacen lista;
  TabController _tabController;
  final myController = TextEditingController();

  _DetalleProductoPageState([this.productoSel]);

  Text etiqueta(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
    );
  }

  DateTime _date;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date == null ? new DateTime.now() : _date,
        firstDate: new DateTime(1960),
        lastDate: new DateTime(2030));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  List<Widget> tarjetasLista() {
    List<Widget> lista = new List<Widget>();
    if (productoSel != null && productoSel.items != null)
      for (var i = 0; i < productoSel.items.length; i++) {
        lista.add(tarjeta(productoSel.items[i]));
      }
    return lista;
  }

  Card tarjeta(ItemAlmacen item) {
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
                  MaterialPageRoute(
                      builder: (context) => ItemsDetallePage(item)),
                );
              },
              child: Hero(
                tag: 'image-hero' + item.titulo,
                child: Container(
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: item.preview,
                  ),
                ),
              )),
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
                          "pro",
                          style: TextStyle(fontSize: 16.0),
                        )),
                      ],
                    )),
                    // Container(
                    //     alignment: Alignment.centerRight,
                    //     margin: EdgeInsets.only(
                    //         top: 10.0, bottom: 10.0, right: 15.0),
                    //     child: IconButton(
                    //       icon: Icon(Icons.share),
                    //       onPressed: () {},
                    //       iconSize: 30.0,
                    //     ))
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
    _date = productoSel.validez;
    print(productoSel.nombre);

    lista = new ListTabItemsAlmacen();
    lista.addItem(
      new Tab(
        text: 'Datos',
      ),
      new Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: body(),
        ),
      ),
    );
    lista.addItem(
        new Tab(text: 'Items'),
        new Container(
          child: ListView(
            children: tarjetasLista(),
          ),
        ));

    _tabController =
        new TabController(vsync: this, length: lista.getTabs().length);
    _tabController.addListener(() {
      this.setState(() {});
    });
  }

  File fotoFondo;

  Future tomarFoto() async {
    try {
      File img = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        fotoFondo = img;
      });
    } catch (e) {}
  }

  List<Widget> body() {
    List<Widget> lista = new List<Widget>();

    lista.add(getHero(productoSel));

    final txtNombreProducto = TextFormField(
      initialValue: productoSel.nombre,
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Nombre del Producto",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtDetalleProducto = TextFormField(
      initialValue: productoSel.descripcion,
      maxLines: 4,
      maxLengthEnforced: true,
      maxLength: 250,
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Detalle de Producto",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtPrecio = TextFormField(
      initialValue: productoSel.precio.toString(),
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType:
          TextInputType.numberWithOptions(decimal: true, signed: false),
      autofocus: false,
      decoration: InputDecoration(
          prefixText: "S/",
          labelText: "Precio",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
    final chkTerceros = Container(
      height: 43.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 23.0),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: productoSel.esTercerizable,
            onChanged: (selected) {
              productoSel.esTercerizable = selected;
              setState(() {
                productoSel.esTercerizable != productoSel.esTercerizable;
              });
            },
          ),
          Expanded(child: Text("Permitir que otro freeler venda este producto"))
        ],
      ),
    );
    final txtFecha = Container(
      height: 43.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 23.0),
      child: Row(
        children: <Widget>[
          Text(_date == null
              ? "Sin límite"
              : "Válido hasta: " + _date.toString().substring(0, 10)),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  )))
        ],
      ),
    );
    lista.add(SizedBox(
      height: 25.0,
    ));
    lista.add(Padding(
      padding: EdgeInsets.only(right: 25.0, left: 25.0),
      child: Column(
        children: <Widget>[
          txtNombreProducto,
          SizedBox(
            height: 25.0,
          ),
          txtDetalleProducto,
          SizedBox(
            height: 25.0,
          ),
          txtPrecio,
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: txtFecha),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          chkTerceros,
          SizedBox(
            height: 75.0,
          ),
        ],
      ),
    ));

    return lista;
  }

  Hero getHero(Producto prod) {
    return new Hero(
        tag: 'image-hero' + productoSel.nombre,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Container(
                  height: 250.0,
                  alignment: Alignment.bottomLeft,
                  padding: new EdgeInsets.only(bottom: 8.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(1.0), BlendMode.dstATop),
                      image: fotoFondo == null
                          ? prod.imagenPreview== null?new AssetImage("assets/imgs/hamburguesa.jpg"):prod.imagenPreview
                          : FileImage(fotoFondo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    constraints: BoxConstraints.tightForFinite(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      child: Icon(
                        Icons.photo_camera,
                        size: 24.0,
                      ),
                      onPressed: () {
                        tomarFoto();
                      },
                    ),
                  )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final txtNombreProducto = TextFormField(
      initialValue: productoSel.nombre,
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Nombre del Producto",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtDetalleProducto = TextFormField(
      initialValue: productoSel.descripcion,
      maxLines: 4,
      maxLengthEnforced: true,
      maxLength: 250,
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Detalle de Producto",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtPrecio = TextFormField(
      initialValue: productoSel.precio.toString(),
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType:
          TextInputType.numberWithOptions(decimal: true, signed: false),
      autofocus: false,
      decoration: InputDecoration(
          prefixText: "S/",
          labelText: "Precio",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final chkTerceros = Container(
      height: 43.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 23.0),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: productoSel.esTercerizable,
            onChanged: (selected) {
              productoSel.esTercerizable = selected;
              setState(() {
                productoSel.esTercerizable != productoSel.esTercerizable;
              });
            },
          ),
          Expanded(child: Text("Permitir que otro freeler venda este producto"))
        ],
      ),
    );

    final txtFecha = Container(
      height: 43.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 23.0),
      child: Row(
        children: <Widget>[
          Text(_date == null
              ? "Sin límite"
              : "Válido hasta: " + _date.toString().substring(0, 10)),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  )))
        ],
      ),
    );

    if (productoSel.items == null || productoSel.items.length <=  1) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            textTheme: TextTheme(
                title: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            )),
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
            title: Text("Producto"),
          ),
          body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            Hero(
              tag: 'image-hero' + productoSel.nombre,
              child: Container(
                  constraints: new BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: new EdgeInsets.only(bottom: 8.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(1.0), BlendMode.dstATop),
                      image: fotoFondo == null
                          ? productoSel.imagenPreview == null?new AssetImage("assets/imgs/hamburguesa.jpg"):productoSel.imagenPreview 
                          : FileImage(fotoFondo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    constraints: BoxConstraints.tightForFinite(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: MaterialButton(
                      child: Icon(
                        Icons.photo_camera,
                        size: 24.0,
                      ),
                      onPressed: () {
                        tomarFoto();
                      },
                    ),
                  )),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.0, left: 25.0),
              child: Column(
                children: <Widget>[
                  txtNombreProducto,
                  SizedBox(
                    height: 25.0,
                  ),
                  txtDetalleProducto,
                  SizedBox(
                    height: 25.0,
                  ),
                  txtPrecio,
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: txtFecha),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  chkTerceros,
                  SizedBox(
                    height: 75.0,
                  ),
                ],
              ),
            )
          ]),
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.save),
              label: Text('Guardar'),
              onPressed: () {}));
    }
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              labelColor: Colors.black,
              controller: _tabController,
              tabs: lista.getTabs()),
          backgroundColor: Colors.white,
          textTheme: TextTheme(
              title: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          )),
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
          title: Text("Combo"),
        ),
        body: new TabBarView(
            controller: _tabController, children: lista.getElementos()),

        // ListView(
        //   scrollDirection: Axis.vertical,
        //   children: body(),
        // ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.save),
            label: Text('Guardar'),
            onPressed: () {}));
  }
}

class TabItemsAlmacen {
  Tab tab;
  Widget elemento;
  TabItemsAlmacen(this.tab, this.elemento);
}

class ListTabItemsAlmacen {
  List<TabItemsAlmacen> productos;
  List<Tab> tabs;
  List<Widget> elementos;

  ListTabItemsAlmacen() {
    productos = new List<TabItemsAlmacen>();
    tabs = new List<Tab>();
    elementos = new List<Widget>();
  }

  void addItem(Tab tab, Widget elemento) {
    productos.add(new TabItemsAlmacen(tab, elemento));
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
