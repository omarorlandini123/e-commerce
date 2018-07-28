import 'package:flutter/material.dart';

class DetalleProductoPage extends StatefulWidget {
  static String tag = 'detalle-product-page';
  final String imageURL;
  DetalleProductoPage(final this.imageURL);

  @override
  _DetalleProductoPageState createState() =>
      _DetalleProductoPageState(this.imageURL);
}

class _DetalleProductoPageState extends State<DetalleProductoPage> {
  String imageURL;

  _DetalleProductoPageState(this.imageURL);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Hamburguesa"),
      ),
      body: ListView(
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
            child: new Text('Hamburguesa',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
          ),
        ],
      ),
    );
  }
}
