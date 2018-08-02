import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DetalleProductoPage extends StatefulWidget {
  static String tag = 'detalle-product-page';
  final String imageURL;
  DetalleProductoPage(final this.imageURL);

  @override
  _DetalleProductoPageState createState() =>
      _DetalleProductoPageState(this.imageURL);
}

final double tamanoTexto = 16.0;
final double espaciado = 8.0;

class _DetalleProductoPageState extends State<DetalleProductoPage> {
  String imageURL;
  final myController = TextEditingController();

  _DetalleProductoPageState(this.imageURL);
  Text etiqueta(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
    );
  }

  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(1960),
        lastDate: new DateTime(2030));
    if (picked != null && picked != _date) {
      print('Selected Date ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    final txtNombreProducto = TextFormField(
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
          Text('Válido: '+'${_date.toString()}'.substring(0, 10)),
          Expanded(child:Container(
            alignment: Alignment.centerRight,
            child:IconButton(
              icon:Icon(Icons.calendar_today),
              onPressed: (){
                _selectDate(context);
              },
            )
          ))
        ],
      ),
    );
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
          title: Text("Detalles "),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                constraints: new BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                alignment: Alignment.bottomLeft,
                padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(1.0), BlendMode.dstATop),
                    image: fotoFondo==null? new AssetImage(imageURL):FileImage(fotoFondo),
                    
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () {
                      tomarFoto();
                    },
                  ),
                )),
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
                      //etiqueta('${_date.toString()}'.substring(0, 10)),
                      Expanded(child: txtFecha),

                      // RaisedButton(
                      //   child: new Text('Fecha de vencimiento'),
                      //   onPressed: () {
                      //     _selectDate(context);
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 75.0,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.save),
            label: Text('Guardar'),
            onPressed: () {}));
  }
}
