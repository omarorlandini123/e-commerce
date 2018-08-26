import 'package:Freeler/entidades/Cliente.dart';
import 'package:Freeler/entidades/CompraDetalle.dart';
class Compra{
  int idCompra;
  Cliente cliente;
  double precio;
  double impuesto;
  double total;
  List<CompraDetalle> detalles;

}