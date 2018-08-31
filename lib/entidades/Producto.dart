import 'package:Freeler/entidades/ItemAlmacen.dart';
import 'package:Freeler/entidades/Mostrador.dart';
import 'package:Freeler/entidades/FotoPreview.dart';

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

  Producto(this.nombre, this.descripcion, this.precio, this.esTercerizable,
      [this.validez, this.items]);

  factory Producto.fromJson(Map<String, dynamic> json) {
    Producto item =
        Producto(json['nombre'], json['descripcion'], json['precio'], json['esTercerizable'],json['validez']);
    item.items = json['items'];
    return item;
  }

  

  void addItem(ItemAlmacen item) {
    if (items == null) {
      items = new List<ItemAlmacen>();
    }
    if (!items.contains(item)) {
      items.add(item);
    }
  }

  bool removeItem(ItemAlmacen element) {
    if (items == null) {
      return false;
    }
    if (items.contains(element)) {
      return items.remove(element);
    }
    return false;
  }
}
