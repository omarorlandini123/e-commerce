import 'package:flutter/material.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';
import 'package:ecommerce/entidades/Mostrador.dart';
import 'package:ecommerce/entidades/FotoPreview.dart';

class Producto {

  int idProducto;
  Mostrador mostrador;
  List<ItemAlmacen> items;
  FotoPreview imagenPreview;

  String nombre;
  String descripcion;
  double precio;
  double stock;
  DateTime validez;
  bool esTercerizable;

  

  Producto(this.nombre, this.descripcion, this.precio, 
      this.esTercerizable,
      [this.validez,this.items]);
     

  void addItem(ItemAlmacen item) {
    if (items == null) {
      items = new List<ItemAlmacen>();
    }
    if (!items.contains(item)) {
      items.add(item);
    }
  }

  bool removeItem(ItemAlmacen element){
    if(items==null){
      return false;
    }
    if(items.contains(element)){
      return items.remove(element);
    }
    return false;
  }

}
