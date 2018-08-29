import 'package:flutter/material.dart';

class ItemAlmacen {
  ImageProvider preview;
  String titulo;
  String descripcion;
  double cantidad;
  String imgURL;

  ItemAlmacen(this.titulo, this.descripcion, this.cantidad,[this.imgURL, this.preview]);

  factory ItemAlmacen.fromJson(Map<String, dynamic> json) {
    ItemAlmacen item = ItemAlmacen(json['userId'], json['id'], json['title'],json['imgURL']);
    item.preview = NetworkImage("http://www.bsmc.net.au/wp-content/uploads/No-image-available.jpg");
    return item;
  }
}
