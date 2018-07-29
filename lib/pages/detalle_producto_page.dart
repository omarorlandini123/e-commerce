import 'package:flutter/material.dart';
import 'dart:async';

class DetalleProductoPage extends StatefulWidget {
  static String tag = 'detalle-product-page';
  final String imageURL;
  DetalleProductoPage(final this.imageURL);

  @override
  _DetalleProductoPageState createState() =>
      _DetalleProductoPageState(this.imageURL);
}

   final double tamanoTexto=16.0;
  final double espaciado=8.0;

class _DetalleProductoPageState extends State<DetalleProductoPage> {
  String imageURL;

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


  final txtDetalleProducto = TextFormField(
      style:
          TextStyle(fontSize:tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Detalle de Producto",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

  final txtPrecio = TextFormField(
      style:
          TextStyle(fontSize:tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Precio",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Hamburguesa"),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 25.0, left :25.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            constraints: new BoxConstraints.expand(
              height: 200.0,
            ),
            alignment: Alignment.bottomLeft,
            padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: new AssetImage(imageURL),
                fit: BoxFit.cover,
              ),
            ),
            child: new Text('',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
          ),
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
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget>[
              etiqueta('${_date.toString()}'.substring(0,10)),
              SizedBox(
                width: 25.0,
              ),
              RaisedButton(
                child: new Text('Fecha de vencimiento'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
