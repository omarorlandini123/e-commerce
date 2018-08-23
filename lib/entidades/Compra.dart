import 'package:ecommerce/entidades/Cliente.dart';
import 'package:ecommerce/entidades/CompraDetalle.dart';
class Compra{
  int idCompra;
  Cliente cliente;
  double precio;
  double impuesto;
  double total;
  List<CompraDetalle> detalles;

}