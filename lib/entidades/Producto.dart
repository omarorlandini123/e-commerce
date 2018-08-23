import 'package:flutter/material.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';

class Producto {

  

  String _nombreProducto;

  String get nombreProducto => _nombreProducto;

  set nombreProducto(String nombreProducto) {
    _nombreProducto = nombreProducto;
  }
  String _detalleProducto;

  String get detalleProducto => _detalleProducto;

  set detalleProducto(String detalleProducto) {
    _detalleProducto = detalleProducto;
  }
  double _precio;

  double get precio => _precio;

  set precio(double precio) {
    _precio = precio;
  }
  DateTime _validez;

  DateTime get validez => _validez;

  set validez(DateTime validez) {
    _validez = validez;
  }
  bool _esTercerizable;

  bool get esTercerizable => _esTercerizable;

  set esTercerizable(bool esTercerizable) {
    _esTercerizable = esTercerizable;
  }
  List<ItemAlmacen> _items;

  List<ItemAlmacen> get items => _items;

  set items(List<ItemAlmacen> items) {
    _items = items;
  }
  ImageProvider _imagenPreview;

  ImageProvider get imagenPreview => _imagenPreview;

  set imagenPreview(ImageProvider imagenPreview) {
    _imagenPreview = imagenPreview;
  } 

  Producto(this._nombreProducto, this._detalleProducto, this._precio, 
      this._esTercerizable,
      [this._validez,this._items]);

     

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
