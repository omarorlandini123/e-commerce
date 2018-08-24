import 'package:flutter/material.dart';
import 'package:ecommerce/pages/page_detalle_producto.dart';
import 'package:ecommerce/entidades/Producto.dart';
import 'package:share/share.dart';

class ProductoCard extends StatelessWidget {
  final Producto prodSelected;

  ProductoCard(this.prodSelected);

  void navegarAlDetalle(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetalleProductoPage(prodSelected)),
    );
  }

  Widget miniatura(BuildContext context) {
    return GestureDetector(
        onTap: () => navegarAlDetalle(context),
        child: Hero(
          tag: 'image-hero' + prodSelected.nombre,
          child: Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: prodSelected.imagenPreview.imageProvider,
            ),
          ),
        ));
  }

  Widget contenido(BuildContext context) {
    return new Expanded(
      child: Container(
          margin: EdgeInsets.only(top: 10.0, left: 5.0),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              contenidoCentral(),
              contenidoDerecha(context),
            ],
          )),
    );
  }

  void compartir(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    
    Share.share("Nuevo Producto compartido "+prodSelected.nombre,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  Widget contenidoDerecha(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
        child: IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.black38,
          ),
          onPressed: ()=>compartir(context),
          iconSize: 30.0,
        ));
  }

  Widget contenidoCentral() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
            child: Text(
          prodSelected.nombre,
          style: TextStyle(fontSize: 16.0),
        )),
        SizedBox(
          height: 10.0,
        ),
        Material(
            child: Text(
          "S/ " + prodSelected.precio.toString(),
          style: TextStyle(fontSize: 16.0),
        ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 3.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          miniatura(context),
          contenido(context),
        ],
      ),
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
    );
  }
}
