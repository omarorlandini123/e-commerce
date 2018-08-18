import 'dart:async';
import 'dart:io';
import 'package:ecommerce/entidades/ItemAlmacen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemsDetallePage extends StatefulWidget {
  static String tag = "item-detalle-page";
  ItemAlmacen itemSelect;
  ItemsDetallePage([this.itemSelect]);
  @override
  _ItemsDetallePageState createState() => _ItemsDetallePageState(itemSelect);
}

class _ItemsDetallePageState extends State<ItemsDetallePage> {
  File fotoFondo;
  ItemAlmacen itemSelect;
  _ItemsDetallePageState([this.itemSelect]);

  Future<Null> _neverSatisfied() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Ofrecer este producto'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future tomarFoto() async {
    try {
      File img = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        fotoFondo = img;
      });
    } catch (e) {}
  }

  bool editando = false;

  Widget boton() {
    return FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        child: editando ? Icon(Icons.save) : Icon(Icons.edit),
        onPressed: () {
          setState(() {
            editando = !editando;
          });
        });
  }

  final double tamanoTexto = 16.0;
  final double espaciado = 8.0;

  @override
  Widget build(BuildContext context) {
    final txtNombreProducto = TextFormField(
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Nombre del Item",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtDetalleProducto = TextFormField(
      maxLines: 4,
      maxLengthEnforced: true,
      maxLength: 250,
      style: TextStyle(
          fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Detalle de Item",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    return Scaffold(
        appBar: AppBar(
          title: new Text("Detalle de Item"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Ofrecer",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: _neverSatisfied,
            )
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Hero(
              tag: 'image-hero' + itemSelect.titulo,
              child: Container(
                  constraints: new BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: new EdgeInsets.only( bottom: 8.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(1.0), BlendMode.dstATop),
                      image: fotoFondo == null
                          ? new AssetImage("assets/imgs/hamburguesa.jpg")
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
                      
                      child: Icon(Icons.photo_camera, size: 24.0,),                      
                      onPressed: () {
                        tomarFoto();
                      },
                    ),
                  )
                  ),
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
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: boton());
  }
}
