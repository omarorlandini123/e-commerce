import 'package:ecommerce/entidades/Empresa.dart';
import 'package:ecommerce/entidades/Mostrador.dart';
import 'package:ecommerce/entidades/Almacen.dart';
class Local {
  String nombre;
  String ubicacion;
  Empresa empresa;
  List<Mostrador> mostradores;
  List<Almacen> almacenes;

  Local (this.nombre, this.ubicacion, this.empresa);

}
