import 'package:Freeler/entidades/Empresa.dart';
import 'package:Freeler/entidades/Mostrador.dart';
import 'package:Freeler/entidades/Almacen.dart';
class Local {
  String nombre;
  String ubicacion;
  Empresa empresa;
  List<Mostrador> mostradores;
  List<Almacen> almacenes;

  Local (this.nombre, this.ubicacion, this.empresa);

}
